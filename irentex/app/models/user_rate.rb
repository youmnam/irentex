class UserRate < ActiveRecord::Base
  belongs_to :ur_owner
  belongs_to :ur_user
end
