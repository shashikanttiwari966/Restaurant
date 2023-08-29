class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.float :price
      t.boolean :available
      t.integer :availability_status

      t.timestamps
    end
  end
end
