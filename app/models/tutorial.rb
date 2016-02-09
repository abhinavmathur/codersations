# == Schema Information
#
# Table name: tutorials
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  title          :string
#  description    :text
#  points_covered :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  link_to_repo   :string
#  slug           :string
#  author_id      :integer
#

class Tutorial < ActiveRecord::Base
  markable_as :favorite
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :contributors
  has_many :members, through: :contributors
  has_many :infos

  validates :title, :description, :points_covered, presence: true

end
