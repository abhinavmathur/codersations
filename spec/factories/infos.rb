# == Schema Information
#
# Table name: infos
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  tutorial_id :integer
#  category_id :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :info do
    title "MyString"
    content "MyText"
    tutorial nil
    category nil
    slug "MyString"
  end
end
