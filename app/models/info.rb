# == Schema Information
#
# Table name: infos
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  tutorial_id :integer
#  category_id :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Info < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  searchkick text_start: ['title^10',:content], batch_size: 100


  belongs_to :tutorial
  belongs_to :category
  has_many :notes, dependent: :destroy

  validates :title, :content, presence: true


  def slug_candidates
    [
        :title,
        [:id, :title]
    ]
  end

end
