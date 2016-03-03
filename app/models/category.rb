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
  #validations
  validates :name, presence: true, uniqueness: true
  #validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z]+\z/, message: 'Must be lowercase' }
  #/validations
  has_many :templates
  has_many :tutorials


end
