class Restaurant < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true

  belongs_to :user
  has_many :promotions, dependent: :destroy

  has_many :menus, dependent: :destroy
  has_many :item_details, through: :menus, dependent: :destroy
end
