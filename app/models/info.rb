class Info < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged




  belongs_to :tutorial
  belongs_to :category

  validates :title, :content, presence: true


  def slug_candidates
    [
        :title,
        [:id, :title]
    ]
  end

end
