class AddSlugToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :slug, :string
  end
end
