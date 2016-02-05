class AddTemplateAndCategoryToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :template, index: true, foreign_key: true
    add_reference :pages, :category, index: true, foreign_key: true
  end
end
