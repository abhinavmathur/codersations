class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.references :tutorial, index: true, foreign_key: true
      t.boolean :pinned, default: false
      t.boolean :solved, default: false

      t.timestamps null: false
    end
  end
end
