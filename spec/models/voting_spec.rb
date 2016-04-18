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

require 'rails_helper'

RSpec.describe Voting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
