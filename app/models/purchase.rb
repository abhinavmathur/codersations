# == Schema Information
#
# Table name: purchases
#
#  id                  :integer          not null, primary key
#  name                :string
#  email               :string
#  amount              :integer          default("0")
#  date                :string
#  author_name         :string
#  tutorial_name       :string
#  guid                :string
#  card_last4          :string
#  card_exp_month      :string
#  card_exp_year       :string
#  card_type           :string
#  balance_transaction :string
#  user_id             :integer
#  tutorial_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  charge_id           :string
#

class Purchase < ActiveRecord::Base
  before_create :populate_guid
  belongs_to :users
  belongs_to :tutorials

  def populate_guid
    self.guid = SecureRandom.hex(10)
  end
end
