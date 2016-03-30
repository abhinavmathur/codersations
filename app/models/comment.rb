# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  title       :string
#  content     :text
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :question
end
