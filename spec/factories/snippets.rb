# == Schema Information
#
# Table name: snippets
#
#  id          :integer          not null, primary key
#  category_id :integer
#  title       :string
#  content     :text
#  featured    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#

FactoryGirl.define do
  factory :snippet do
    category nil
    title "MyString"
    content "MyText"
    featured false
  end
end
