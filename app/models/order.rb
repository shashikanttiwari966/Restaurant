class Order < ApplicationRecord
  enum status: ["Created","Pending","Paid","Canceled"]
  has_and_belongs_to_many :menus_orders
end
