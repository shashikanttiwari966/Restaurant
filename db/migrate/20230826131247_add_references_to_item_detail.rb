class AddReferencesToItemDetail < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_details, :category
  end
end
