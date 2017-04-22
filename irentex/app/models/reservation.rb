class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :renter
end
