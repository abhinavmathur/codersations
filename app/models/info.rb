class Info < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :tutorial
  belongs_to :category

  validates :title, :content, presence: true
end
