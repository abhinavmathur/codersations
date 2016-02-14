class AddCreatorsAndManagersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :creator, :boolean, default: false
    add_column :users, :manager, :boolean, default: false
  end
end
