# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  title       :string
#  content     :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  points      :integer          default("0")
#

class Comment < ActiveRecord::Base
  belongs_to :question
  validates :content, presence: true

end
