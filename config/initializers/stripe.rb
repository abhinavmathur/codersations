Stripe.api_key = ENV["STRIPE_SECRET_KEY"]


class RecordCharges
  def call(event)
    charge = event.data.object
    user = User.find_by(stripe_id: charge.customer)
    user.charges.create(
        stripe_id: charge.id,
        amount: charge.amount,
        card_last4: charge.source.last4,
        card_type: charge.source.brand,
        card_exp_month: charge.source.exp_month,
        card_exp_year: charge.source.exp_year,
        data_type: 'charge'
    )
  end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end
