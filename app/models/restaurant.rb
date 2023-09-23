class Restaurant < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true

  belongs_to :user
  has_many :promotions

  has_many :menus
  has_many :item_details, through: :menus
end
