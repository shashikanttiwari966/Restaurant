class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fssi_number, :bigint
    add_column :users, :secret_code, :string
  end
end
