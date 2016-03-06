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
