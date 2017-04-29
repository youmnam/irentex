$searchRes = 0
$searchCatId = 0
$itemsS = nil
$filtersS = nil
$minPriceS = 0
$maxPriceS = 0
$CityArray = User.distinct.pluck(:usr_city)
$ColorArray = ['Red','Green', 'Pink', 'Black' , 'White']
$SizeArray = ['S','M', 'L' , 'XL' ,'XXL' , 'XXXL' ]
$OccasionArray = ['Formal Affair','Party','Vacation','Weeding','Weekend' , 'Work' ]

$CheckBoxesArray = {"Color" => $ColorArray , "Size" => $SizeArray , 'Occasion' => $OccasionArray , 'City' => $CityArray}
class CategoryItemsController < ApplicationController

def new
end

def show


     if $searchRes == 2 
      
	  
	  
    @items = $itemsS 
	@filters = $filtersS   
	@ColourArr = $ColourArray	
	@minPrice = $minPriceS
	@maxPrice = $maxPriceS
	@CheckBoxesArray = $CheckBoxesArray	
	
	$searchRes = 0
	 
	  
	  else 
	
	
	$searchCatId = params[:iid]
    
	
	
	
	@items = Item.findwithcategory(params[:iid])   
    @filters = 	CategoryFilter.findByCat(params[:iid])
	$itemsS = @items 
	$filtersS = @filters  
    @CheckBoxesArray = $CheckBoxesArray	
	
	arr = []
	count =0 
	$itemsS.minmax.each do |x|
	
	arr[count] = x.item_price
	count += 1
	end 
	
	$minPriceS = arr[0]
	$maxPriceS = arr[1]
	@minPrice = $minPriceS
	@maxPrice = $maxPriceS
	
	#puts $CheckBoxesArray[0]
	
	end
end

def searchCat
    
   #Message.where(user_id: Profile.select("user_id").where(gender: 'm'))
	
	#$ColourArray.each do |c|
		#puts params["Color_"+c]
	#end
	#@arr = CarCat.order(:id)
	#$count = countOfArray(CarCat.order(:id))
	     
	    filterArr = CategoryFilter.findByCat($searchCatId)
		arrChecxBoxes = $CheckBoxesArray
        arr = ItemSpec.findAll(filterArr , params , arrChecxBoxes)
		
		itemsArray = Item.findAll(params ,$searchCatId , arrChecxBoxes) 
		
		if arr == "NotSelected"
		intersectionItems = itemsArray
	else 
		
		arrOfItems=[]
		arr.each do |c|
		puts c.item_id
		arrOfItems.push(c.item_id) 
	    end 

		temparr = arrOfItems.find_all { |e| arrOfItems.count(e) > 1}
    
		puts "temparr"
		puts arr
		
		itemsArray2  = Item.where("id IN (?) and category_id = (?)", arrOfItems,$searchCatId)		
		
		intersectionItems = (itemsArray2 & itemsArray)
	end
		
		
		$itemsS = intersectionItems
        #Item.where("id IN (?) and category_id = (?)", arrOfItems,$searchCatId)		
		
		#Item.where("id IN (?) and category_id = (?)", arrOfItems,$searchCatId)		
	    $searchRes = 2
        redirect_to showcat_path(:iid =>$searchCatId)
         
end 

private
  def countOfArray(arr)
    
	$c = 0
	for element in arr do
	 $c += 1 
    end
	return $c
  end



end