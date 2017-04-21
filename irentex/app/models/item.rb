class Item < ActiveRecord::Base
	belongs_to :user
	has_many :item_attachments
	has_one :item_spec
    accepts_nested_attributes_for :item_attachments
	accepts_nested_attributes_for :item_spec

def self.search(search)
  where("item_name LIKE ?", "%#{search}%") 
end

def self.findwithuser(userid)
  where("user_id = ?", "#{userid}") 
end
end
