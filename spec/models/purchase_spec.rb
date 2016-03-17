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

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
