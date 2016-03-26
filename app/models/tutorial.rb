# == Schema Information
#
# Table name: tutorials
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  title             :string
#  description       :text
#  points_covered    :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  link_to_repo      :string
#  slug              :string
#  author_id         :integer
#  publish           :boolean          default("false")
#  template_id       :integer
#  impressions_count :integer          default("0")
#  price             :integer          default("0")
#

class Tutorial < ActiveRecord::Base
  markable_as :favorite
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  searchkick text_start: ['title^10', :description, :points_covered]

  def slug_candidates
    [:id, :title]
  end

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :contributors, dependent: :destroy
  has_many :members, through: :contributors, dependent: :destroy
  has_many :infos, dependent: :delete_all
  has_many :purchases, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :snippets, dependent: :nullify

  validates :title, :description, :points_covered, presence: true


end
