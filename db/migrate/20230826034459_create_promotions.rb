class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.references :item_detail, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :discount

      t.timestamps
    end
  end
end
