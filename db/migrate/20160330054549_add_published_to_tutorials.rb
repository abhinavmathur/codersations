class AddPublishedToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :published, :boolean, default: false
  end
end
