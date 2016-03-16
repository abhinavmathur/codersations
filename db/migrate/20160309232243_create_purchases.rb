class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.string :email
      t.integer :amount, default: 0
      t.string :date
      t.string :author_name
      t.string :tutorial_name
      t.string :guid
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :card_type
      t.string :balance_transaction
      t.integer :user_id
      t.integer :tutorial_id

      t.timestamps null: false
    end
  end
end
