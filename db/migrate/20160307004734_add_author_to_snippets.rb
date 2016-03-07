class AddAuthorToSnippets < ActiveRecord::Migration
  def change
    add_reference :snippets, :author, index: true
    add_foreign_key :snippets, :users, column: :author_id
  end
end
