class CreateDeliveryVehichles < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_vehichles do |t|
      t.boolean :available
      t.integer :availibility_status
      t.integer :fuel_status
      t.integer :vehichle_type
      t.string :vehichle_register_number

      t.timestamps
    end
  end
end
