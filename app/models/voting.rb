# == Schema Information
#
# Table name: votings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  votable    :integer
#  voted      :boolean          default("false")
#  upvote     :boolean          default("false")
#  downvote   :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Voting < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
