class AddPublishToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :publish, :boolean, default: false
  end
end
