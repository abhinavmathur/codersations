class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :points_covered
      t.string :repo_link

      t.timestamps null: false
    end
  end
end
