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

def self.findbyCat(catid)
  where("category_id = ?", "#{catid}") 
end

def self.findwithcategory(category_id)
  where("category_id LIKE ?", "%#{category_id}%") 
end

def self.findAll( searchCrieria , category_id , arrayOfChexBoxes)
 
$query = " 1 = 1 "
 
 $query  += " AND item_price " + " BETWEEN  " + "#{searchCrieria["FPrice"]}" +" AND " + "#{searchCrieria["TPrice"]}"
 
 
 $ValuesIn = "("

         # puts arrayOfChexBoxes["Color"]
			
			arrayOfChexBoxes["City"].each do |c|
			
			
			if searchCrieria["City_"+c] != nil
				$ValuesIn += "'#{c}' ,"  
			end 	 
		end
			n = $ValuesIn.size
			$ValuesIn = $ValuesIn[0..n-2]
			$ValuesIn += ")" 
			
			if $ValuesIn.size != 2
			
			$query  += " and user_id in (select id from users where users.usr_city in " + $ValuesIn + " )"
			end 
			
 
 
 $query  += " and category_id = " + category_id
 where($query)
end


end
