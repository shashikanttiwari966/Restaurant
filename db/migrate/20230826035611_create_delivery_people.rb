class CreateDeliveryPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_people do |t|
      t.boolean :available
      t.integer :availibility_status
      t.string :name
      t.integer :age
      t.integer :sex
      t.integer :salary
      t.text :home_address
      t.string :vehichle_register_number

      t.timestamps
    end
  end
end
