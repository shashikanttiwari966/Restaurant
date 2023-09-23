class ItemDetail < ApplicationRecord

  validates :name, :category_id, :image, presence: true
  has_one_attached :image
  has_many :promotions
  belongs_to :category

  has_many :menus
  has_many :restaurants, through: :menus

end
