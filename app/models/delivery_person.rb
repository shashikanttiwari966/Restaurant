class DeliveryPerson < ApplicationRecord
  enum availibility_status: ["Busy","Available"]
end
