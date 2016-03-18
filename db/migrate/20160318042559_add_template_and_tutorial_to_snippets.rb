class AddTemplateAndTutorialToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :template_id, :integer
    add_column :snippets, :tutorial_id, :integer
  end
end
