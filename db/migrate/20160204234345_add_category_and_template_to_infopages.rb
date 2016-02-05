class AddCategoryAndTemplateToInfopages < ActiveRecord::Migration
  def change
    add_reference :infopages, :template, index: true, foreign_key: true
    add_reference :infopages, :category, index: true, foreign_key: true
  end
end
