FactoryGirl.define do
  factory :datum do
    user_id ""
    amount 1
    card_last4 "MyString"
    card_type "MyString"
    card_exp_month "MyString"
    card_exp_year "MyString"
    stripe_id "MyString"
    data_type "MyString"
  end
end
