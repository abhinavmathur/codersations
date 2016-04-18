class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :votable
      t.boolean :voted, default: false
      t.boolean :upvote, default: false
      t.boolean :downvote, default: false

      t.timestamps null: false
    end
  end
end
