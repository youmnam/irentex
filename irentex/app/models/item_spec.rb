class ItemSpec < ActiveRecord::Base
  belongs_to :item
  belongs_to :category_filter


  def self.findbyItem(itemid)
  	where("item_id = ?", "#{itemid}") 
  end
end
