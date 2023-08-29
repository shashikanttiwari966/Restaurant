class DeliveryVehichle < ApplicationRecord
  enum availibility_status: ["Busy","Available"]
end
