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
#  publish     :boolean          default("false")
#  slug        :string
#  template_id :integer
#  tutorial_id :integer
#

class Snippet < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: 'User'
  belongs_to :tutorial
  belongs_to :template
  extend FriendlyId
  friendly_id :title, use: :slugged
  markable_as :favorite
  markable_as :like
  validates :title, :content, presence: true
end
