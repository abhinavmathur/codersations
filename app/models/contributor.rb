# == Schema Information
#
# Table name: contributors
#
#  id          :integer          not null, primary key
#  tutorial_id :integer
#  access      :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :integer
#

class Contributor < ActiveRecord::Base
  belongs_to :member, class_name: 'User'
  belongs_to :tutorial, dependent: :destroy

  #validations
  validates :member_id, :tutorial_id, presence: true
end
