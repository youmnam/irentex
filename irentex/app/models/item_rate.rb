class ItemRate < ActiveRecord::Base
  belongs_to :ir_item
  belongs_to :ir_user
end
