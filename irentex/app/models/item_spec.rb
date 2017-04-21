class ItemSpec < ActiveRecord::Base
  belongs_to :item
  belongs_to :category_filter


  def self.findbyItem(itemid)
  	where("item_id LIKE ?", "%#{itemid}%") 
  end
end
