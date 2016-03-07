class AddPublishandSlugToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :publish, :boolean, default: false
    add_column :snippets, :slug, :string
  end
end
