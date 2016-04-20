module CommentsHelper
  def has_voted?(user, votable)
    Voting.exists?(user: user, votable: votable, voted: true)
  end

  def has_upvoted?(user, votable)
    Voting.exists?(user: user, votable: votable, upvote: true)
  end
  def has_downvoted?(user, votable)
    Voting.exists?(user: user, votable: votable, downvote: true)
  end

  def get_vote_count(comment)
    comment.points
  end
end