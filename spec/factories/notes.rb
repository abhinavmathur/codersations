# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  category_id :integer
#  tutorial_id :integer
#  info_id     :integer
#  user_id     :integer
#  title       :string
#  content     :text
#  task        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :note do
    tutorial_id 1
    info_id 1
    user_id 1
    title "MyString"
    content "MyText"
    task false
  end
end
