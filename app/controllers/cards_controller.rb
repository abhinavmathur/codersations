class CardsController < ApplicationController
  before_action :authenticate_user!
  def update
    begin
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      customer.source = params[:stripeToken]
      customer.save

      current_user.update(
          card_last4: params[:card_last4],
          card_exp_month: params[:card_exp_month],
          card_exp_year: params[:card_exp_year],
          card_type: params[:card_type]
      )

      flash[:success] = 'Your card has been successfully updated.'
      redirect_to edit_user_registration_path
    rescue Stripe::CardError => e
      flash[:danger] = e.to_s
      redirect_to edit_user_registration_path
    end
  end
end