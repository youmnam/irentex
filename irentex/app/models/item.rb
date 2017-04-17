class Item < ActiveRecord::Base
	belongs_to :rentp
	has_many :item_attachments
    accepts_nested_attributes_for :item_attachments

def self.search(search)
  where("item_name LIKE ?", "%#{search}%") 
end

def self.findwithrentp(rentpid)
  where("rentp_id LIKE ?", "%#{rentpid}%") 
end
end
