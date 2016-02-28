module SubscriptionsHelper
  def temp(&block)
    block.call if Rails.env.development?
  end

  #Gets current user and sends the subscription name
  # -> edit_user_registration_path
  def get_susbscription_name(user)
    customer = Stripe::Customer.retrieve(user.stripe_id)
    sub = customer.subscriptions.retrieve(user.stripe_subscription_id)
    sub.plan.name.to_s
  end
end

