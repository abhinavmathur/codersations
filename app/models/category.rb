# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  searchkick text_start: [:name]

  after_save :change_case
  #validations
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  #/validations
  has_many :templates
  has_many :tutorials
  has_many :snippets
  has_many :notes, dependent: :destroy


  private
  def change_case
    self.name.capitalize!
    self.slug.downcase!
  end
end
