class AddFieldsToItemCard < ActiveRecord::Migration[6.1]
  def change
    add_column :card_items, :qty, :integer, default: 1
    add_column :card_items, :price, :float
  end
end
