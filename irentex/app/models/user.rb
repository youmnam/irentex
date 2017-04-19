class User < ActiveRecord::Base
	has_many :items
    belongs_to :user
	accepts_nested_attributes_for :items
	has_secure_password
end
