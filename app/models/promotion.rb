class Promotion < ApplicationRecord
  belongs_to :item_detail
  belongs_to :restaurant
end
