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

class Snippet < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, :content, presence: true
end
