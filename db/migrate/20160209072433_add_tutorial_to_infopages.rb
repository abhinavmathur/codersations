class AddTutorialToInfopages < ActiveRecord::Migration
  def change
    add_reference :infopages, :tutorial, index: true, foreign_key: true
  end
end
