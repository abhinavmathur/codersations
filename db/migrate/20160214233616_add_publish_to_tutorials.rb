class AddPublishToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :publish, :boolean, default: false
  end
end
