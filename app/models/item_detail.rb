class ItemDetail < ApplicationRecord

  validates :name, :category_id, :image, presence: true
  has_one_attached :image
  has_and_belongs_to_many :menus
  has_many :promotions

  belongs_to :category

end
