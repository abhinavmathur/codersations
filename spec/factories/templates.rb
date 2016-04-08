# == Schema Information
#
# Table name: templates
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string
#  description    :text
#  points_covered :text
#  repo_link      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer
#  slug           :string
#  publish        :boolean          default("false")
#

FactoryGirl.define do
  factory :template do
    category nil
    title "A new tutorial"
    description "Lorem Ipsum"
    points_covered "Hello World"
  end

end