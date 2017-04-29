class ItemSpec < ActiveRecord::Base
  belongs_to :item
  belongs_to :category_filter


  
  
  
  def self.findbyItem(itemid)
  	where("item_id LIKE ?", "%#{itemid}%") 
  end
  
  
  
  

  def self.findAll( filterArr , searchValues , arrayOfChexBoxes )
    
	$query = " (1 = 1) "
    
	$SelectedOrNot = "F" 
	
	$checked = 0
	countselected  =0
  filterArr.each do |x| 
   
   
   
   
    if x.typeOfLabel == "FromTo"
	
	
	
	$query  += " AND value " + " BETWEEN  " + "'#{searchValues["F"+x.nameOfLabel]}'" +" AND " + "'#{searchValues["T"+x.nameOfLabel]}'"
	
    elsif x.typeOfLabel == "checkBox"
    
			
			
			$ValuesIn = "("

         # puts arrayOfChexBoxes["Color"]
			
			arrayOfChexBoxes[x.nameOfLabel].each do |c|
			
			
			if searchValues[x.nameOfLabel+"_"+c] != nil
				$ValuesIn += "'#{c}' ,"  
			end 	 
		end
			n = $ValuesIn.size
			$ValuesIn = $ValuesIn[0..n-2]
			$ValuesIn += ")"  
			
			
		 
			
			if $ValuesIn.size != 2
				
				if $checked == 0
				$checked = 1
				$query += " AND ( ( category_filter_id = " + "#{x.id} )"
				else 
				$query += " OR ( ( category_filter_id = " + "#{x.id} )"
				end
				 $query  += " AND  ( value "  + " in " + $ValuesIn + ") )"		
    $SelectedOrNot = "T"	
	countselected = countselected +1 
			end 
	
	else 
		if searchValues[x.nameOfLabel] != ""
			if $checked == 0
		    $checked = 1
			$query += " AND ( (category_filter_id = " + "#{x.id} )"
			else
			$query += " OR ( (category_filter_id = " + "#{x.id} )"
			end 
			$SelectedOrNot = "T"	
			countselected = countselected +1		
			$query  += " AND ( value "  + " LIKE " + "'%#{searchValues[x.nameOfLabel]}%'  ))"
			
		end
	
	end 
	
	
 end 
  

  	if $SelectedOrNot == "T"	
	item = ItemSpec.select('item_id, count(value)').where($query).group("item_id").having( "count(value) = ?",countselected) 
    else 
	item = "NotSelected"
    end 

return item 	  
  end
  
end