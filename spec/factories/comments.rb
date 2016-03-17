# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  comment     :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :comment do
    user_id 1
    comment "MyText"
    question nil
  end
end
