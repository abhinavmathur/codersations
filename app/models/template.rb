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

class Template < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  searchkick text_start: ['name^10', :description, :points_covered], batch_size: 200

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :infopages, dependent: :delete_all
  has_many :snippets


  validates :category_id, :name, :description, :points_covered, presence: true
end
