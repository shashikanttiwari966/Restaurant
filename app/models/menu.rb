class Menu < ApplicationRecord
  has_and_belongs_to_many :item_details
  belongs_to :restaurant
end
