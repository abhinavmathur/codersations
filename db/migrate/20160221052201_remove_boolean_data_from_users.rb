class RemoveBooleanDataFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :display_github, :boolean
    remove_column :users, :display_personal_website, :boolean
    remove_column :users, :display_bitbucket, :boolean
  end
end
