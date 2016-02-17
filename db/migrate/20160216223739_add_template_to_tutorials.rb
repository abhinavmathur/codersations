class AddTemplateToTutorials < ActiveRecord::Migration
  def change
    add_reference :tutorials, :template, index: true
  end
end
