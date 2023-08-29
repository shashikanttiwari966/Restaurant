class CreateJoinItemDetalRestaurant < ActiveRecord::Migration[6.1]
  def change
    create_join_table :item_details, :restaurants do |t|
      # t.index [:item_detail_id, :restaurant_id]
      # t.index [:restaurant_id, :item_detail_id]
    end
  end
end
