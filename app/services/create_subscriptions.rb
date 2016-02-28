class CreateSubscriptions < Struct.new :user
  def find_or_register_user
    customer = if user.stripe_id?
                 Stripe::Customer.retrieve(user.stripe_id)
               else
                 Stripe::Customer.create(email: user.email)
               end
    customer
  end
end