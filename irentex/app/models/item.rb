class Item < ActiveRecord::Base
	belongs_to :user
	has_many :item_attachments
    accepts_nested_attributes_for :item_attachments

def self.search(search)
  where("item_name LIKE ?", "%#{search}%") 
end

def self.findwithuser(userid)
  where("user_id LIKE ?", "%#{userid}%") 
end
end
