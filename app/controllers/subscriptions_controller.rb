class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :redirect_to_signup, only: :new

  def new
  end

  def create
    begin
      obj = CreateSubscriptions.new(current_user)
      customer = obj.find_or_register_user
      if params[:plan] == ""
        flash[:danger] = 'Please select a plan'
        redirect_to subscriptions_path and return
      end
      if current_user.subscribed?
        if customer.subscriptions.retrieve(current_user.stripe_subscription_id).plan.id == params[:plan].to_s
          flash[:danger] = 'You cannot subscribe to the same plan again'
          redirect_to subscriptions_path and return
        end
        customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
      end

      subscription = customer.subscriptions.create(
          source: params[:stripeToken],
          plan: params[:plan]
      )
      current_user.update(
          stripe_id: customer.id,
          stripe_subscription_id: subscription.id,
          card_last4: params[:card_last4],
          card_exp_month: params[:card_exp_month],
          card_exp_year: params[:card_exp_year],
          card_type: params[:card_type]
      )
      ahoy.track "Subscriptions", title: params[:plan].to_s
    rescue Stripe::CardError => e
      flash[:danger] = e.to_s
      redirect_to root_path and return
    end
    if current_user.save
      flash[:success] = 'Your subscription was successful !'
      redirect_to root_path
    end
  end

  def show

  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    flash[:success] = 'Your subscription has been canceled successfully'
    redirect_to root_path
  end

  private
  def redirect_to_signup
    if !user_signed_in?
      session['user_return_to'] = new_subscription_path
      redirect_to new_user_registration_path
    end
  end

end
