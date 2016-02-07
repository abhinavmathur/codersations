class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.text :points_covered
      t.timestamps :published_at, null: true
      t.references :user, index: true, foreign_key: true
      t.string :link_to_repo

      t.timestamps null: false
    end
  end
end
