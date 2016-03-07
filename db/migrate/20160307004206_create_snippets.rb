class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
