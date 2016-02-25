module SubscriptionsHelper
  def temp(&block)
    block.call if Rails.env.development?
  end
end
