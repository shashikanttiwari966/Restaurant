class AddFieldsToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :gst, :float
    add_column :categories, :tax, :float
  end
end
