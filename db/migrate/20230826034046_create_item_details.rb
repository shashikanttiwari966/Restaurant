class CreateItemDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :item_details do |t|
      t.string :name

      t.timestamps
    end
  end
end
