class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :category_id
      t.integer :tutorial_id
      t.integer :info_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.boolean :task

      t.timestamps null: false
    end
  end
end
