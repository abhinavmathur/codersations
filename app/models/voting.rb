# == Schema Information
#
# Table name: votings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  voted        :boolean          default("false")
#  upvote       :boolean          default("false")
#  downvote     :boolean          default("false")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  votable_type :string
#  votable_id   :integer
#  vote_count   :integer          default("0")
#

class Voting < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  def self.upvote!(user, votable)
   Voting.find_or_create_by(user: user, votable: votable, voted: true, upvote: true)
  end

  def self.downvote!(user,votable)
    Voting.find_or_create_by(user:user, votable: votable, voted: true, downvote: true)
  end
end
