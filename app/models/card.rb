class Card < ApplicationRecord
  belongs_to :user
  has_many :card_items
end
