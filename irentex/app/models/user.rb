class User < ActiveRecord::Base
	has_many :rentps
	accepts_nested_attributes_for :rentps
	has_secure_password
end
