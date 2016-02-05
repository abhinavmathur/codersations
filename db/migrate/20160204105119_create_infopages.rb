class CreateInfopages < ActiveRecord::Migration
  def change
    create_table :infopages do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
