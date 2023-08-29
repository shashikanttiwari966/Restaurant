class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :order, null: false, foreign_key: true
      t.text :review_text
      t.float :star

      t.timestamps
    end
  end
end
