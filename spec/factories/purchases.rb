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

FactoryGirl.define do
  factory :purchase do
    name "MyString"
    email "MyString"
    amount "MyString"
    date "MyString"
    author_name "MyString"
    tutorial_name "MyString"
    guid "MyString"
    card_last4 "MyString"
    card_exp_month "MyString"
    card_exp_year "MyString"
    card_type "MyString"
    balance_transaction "MyString"
    user_id 1
    tutorial_id 1
  end
end
