class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :status
      t.float :discount_price
      t.float :total_price
      t.string :city
      t.text :delivery_address

      t.timestamps
    end
  end
end
