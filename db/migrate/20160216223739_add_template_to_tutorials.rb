class AddTemplateToTutorials < ActiveRecord::Migration
  def change
    add_reference :tutorials, :template, index: true, foreign_key: true
  end
end
