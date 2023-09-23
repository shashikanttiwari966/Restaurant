class AddDescriptionToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :description, :text
  end
end
