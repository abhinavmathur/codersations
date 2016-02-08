class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.references :tutorial, index: true, foreign_key: true
      t.boolean :access, default: false

      t.timestamps null: false
    end
  end
end
