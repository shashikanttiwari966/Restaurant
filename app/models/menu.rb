class Menu < ApplicationRecord
  # has_and_belongs_to_many :item_details
  enum availibility_status: ["Available","On-proccess","Temporary unavailable"]  
  belongs_to :item_detail
  belongs_to :restaurant
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :card_items, dependent: :destroy
  has_and_belongs_to_many :menus_orders
end
