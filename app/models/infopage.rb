# == Schema Information
#
# Table name: infopages
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  template_id :integer
#  category_id :integer
#  slug        :string
#  tutorial_id :integer
#

class Infopage < ActiveRecord::Base
  extend FriendlyId
  searchkick text_start: [:title, :content], batch_size: 200
  friendly_id :title, use: :slugged
  belongs_to :category
  belongs_to :template
  validates :title, :content, presence: true
end

