class AddAuthorToTemplates < ActiveRecord::Migration
  def change
    add_reference :templates, :author, index: true
    add_foreign_key :templates, :users, column: :author_id
  end
end
