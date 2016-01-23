class Template < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :category
  belongs_to :author, class_name: 'User'
end
