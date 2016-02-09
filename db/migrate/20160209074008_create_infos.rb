class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :title
      t.text :content
      t.references :tutorial, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
  end
end
