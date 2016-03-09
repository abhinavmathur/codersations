class AddPriceToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :price, :integer, default: 0
  end
end
