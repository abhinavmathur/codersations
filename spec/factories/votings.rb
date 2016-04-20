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

FactoryGirl.define do
  factory :voting do
    user nil
    votable 1
    voted false
    upvote false
    downvote false
  end
end
