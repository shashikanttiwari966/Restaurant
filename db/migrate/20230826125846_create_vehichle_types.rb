class CreateVehichleTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :vehichle_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
