class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.date :opened_on
      t.time :open_time
      t.time :close_time

      t.timestamps
    end
  end
end
