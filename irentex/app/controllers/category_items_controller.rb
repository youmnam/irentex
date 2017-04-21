$searchRes = 0
$searchCatId = 0
$itemsS = nil
$filtersS = nil

class CategoryItemsController < ApplicationController

def new
end

def show


     if $searchRes == 2 
      
    @items = $itemsS 
	@filters = $filtersS   
	   $searchRes = 0
	 
	  
	  else 
	
	if params[:iid] == '1'
	
	$searchCatId = params[:iid]
    @items = Item.findbyCat(params[:iid])   
    @filters = 	CategoryFilter.findByCat(params[:iid])
	$itemsS = @items 
	$filtersS = @filters  
	
	end
	
	
	end
end

def searchCat
    
	# @article = Article.find(params[:id])
    
	
	
    if $searchCatId == '1'
	
	#@arr = CarCat.order(:id)
	#$count = countOfArray(CarCat.order(:id))
	     
	    filterArr = CategoryFilter.findByCat($searchCatId)
   
	    $itemsS = CarCat.findBySearch(filterArr , params) 
		$searchRes = 2
        redirect_to showcat_path(:iid =>$searchCatId)

    end     
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
