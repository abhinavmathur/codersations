class AddConnectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_account_id, :string
    add_column :users, :publishable_key, :string
    add_column :users, :secret_key, :string
    add_column :users, :currency, :string
  end
end
