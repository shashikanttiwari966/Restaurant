class Order < ApplicationRecord
  enum status: ["Created","Pending","Paid","Canceled"]
  belongs_to :item_detail
end
