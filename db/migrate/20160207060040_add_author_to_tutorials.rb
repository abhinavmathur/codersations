class AddAuthorToTutorials < ActiveRecord::Migration
  def change
    add_reference :tutorials, :author, index: true
    add_foreign_key :tutorials, :users, column: :author_id
  end
end
