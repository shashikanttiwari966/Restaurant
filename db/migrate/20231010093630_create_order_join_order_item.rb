class CreateOrderJoinOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :orders, :menus do |t|
    end
  end
end
