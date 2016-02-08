class AddMemberToContributors < ActiveRecord::Migration
  def change
    add_reference :contributors, :member, index: true
    add_foreign_key :contributors, :users, column: :member_id
  end
end
