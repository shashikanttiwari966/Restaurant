class Restaurant < ApplicationRecord
  has_one :menu
  has_many :promotions
end
