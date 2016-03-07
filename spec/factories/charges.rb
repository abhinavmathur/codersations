# == Schema Information
#
# Table name: charges
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  stripe_id      :string
#  amount         :integer
#  card_last4     :string
#  card_type      :string
#  card_exp_month :string
#  card_exp_year  :string
#  data_type      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :charge do
    user_id 1
    stripe_id "MyString"
    amount 1
    card_last4 "MyString"
    card_type "MyString"
    card_exp_month "MyString"
    card_exp_year "MyString"
    data_type "MyString"
  end
end
