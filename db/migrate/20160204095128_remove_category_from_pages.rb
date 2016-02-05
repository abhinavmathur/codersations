class RemoveCategoryFromPages < ActiveRecord::Migration
  def change
    remove_reference :pages, :category, index: true, foreign_key: true
  end
end
