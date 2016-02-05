class AddSlugToInfopages < ActiveRecord::Migration
  def change
    add_column :infopages, :slug, :string
  end
end
