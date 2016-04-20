class AddVotableTypeAndVoteCountToVotings < ActiveRecord::Migration
  def change
    add_column :votings, :votable_type, :string
    add_column :votings, :votable_id, :integer
    add_column :votings, :vote_count, :integer, default: 0
  end
end
