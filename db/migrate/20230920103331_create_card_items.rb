class CreateCardItems < ActiveRecord::Migration[6.1]
  def change
    create_table :card_items do |t|
      t.references :card, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
