class ItemsController < ApplicationController
	def index
	  @item = Item.find(params[:id])
    @item_attachment = @item.item_attachments.all
end

def show
	  @item = Item.find(params[:id])
end

def new
	@user = User.find(params[:user_id])
  @filters =  CategoryFilter.findByCat(@user.categories_id)
  
  @item  = @user.items.build
  @item_attachment = @item.item_attachments.build

  
end
 
def create
  @user = User.find(params[:user_id])
 	@item = @user.items.create(item_params)
  @filters =  CategoryFilter.findByCat(@user.categories_id)
  
  
  if @item.save
        params[:item_attachments]['image'].each do |a|
                  @item_attachment = @item.item_attachments.create!(:image => a)
        end
        
        @filters.each do |fi| 
            @itemSpecs = ItemSpec.create( :item_id => @item.id, :category_filter_id => fi.id, :value => params[fi.nameOfLabel]  )
        end
  		  redirect_to user_path(:id => params[:user_id])
	else
  		render :action => 'new'
	end
  	  	
end

def edit
  @item = Item.find(params[:id])
  @itemSpecs = ItemSpec.findbyItem(@item.id)
    @user = User.find(params[:user_id])
  @filters =  CategoryFilter.findByCat(@user.categories_id)

end
	 
def update
  @user = User.find(params[:user_id])
  @item = Item.find(params[:id])

  @filters =  CategoryFilter.findByCat(@user.categories_id)
  @itemSpecs = ItemSpec.findbyItem(@item.id)

  if @item.update(item_params)
      k =0
      @filters.each do |fi| 
            @itemSpecs[k].update(:value => params[fi.nameOfLabel] )
            k = k+1
      end
      redirect_to user_path(:id => params[:user_id])
  else
    render 'edit'
  end
end

def destroy
  @user = User.find(params[:user_id])
  @item = Item.find(params[:id])

  @itemSpecs = ItemSpec.findbyItem(@item.id)

  @itemSpecs.each do |is|
              is.destroy
          end
  @item.destroy

  
  redirect_to user_path(:id => params[:user_id])
end

private
def item_params
	    params.require(:item).permit(:item_name,:item_desc,:item_price,:category_id)
end
end
