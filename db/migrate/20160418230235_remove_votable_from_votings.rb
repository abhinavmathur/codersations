class RemoveVotableFromVotings < ActiveRecord::Migration
  def change
    remove_column :votings, :votable, :integer
  end
end
