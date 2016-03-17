# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  tutorial_id :integer
#  pinned      :boolean          default("false")
#  solved      :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  content     :text
#

FactoryGirl.define do
  factory :question do
    title "MyString"
    tutorial nil
    pinned false
    solved false
  end
end
