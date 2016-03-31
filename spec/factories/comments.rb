# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  title       :string
#  content     :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :comment do
    user_id 1
    comment "MyText"
    question nil
  end
end
