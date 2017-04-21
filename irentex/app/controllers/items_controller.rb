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

  #to add product specs
  labels_id = []
  values = []
  @filters =  CategoryFilter.findByCat(@user.categories_id)
  
  #pvalues = Array.new(@filters.length) { Hash.new }
   i=0;  
  @filters.each do |fi| 
    #labels_id.push(fi.id)
    #values.push(params[fi.nameOfLabel])
    pvalues[i][fi.nameOfLabel] = params[fi.nameOfLabel]
    i = i+1
  end
puts pvalues
  #@itemSpecs = ItemSpec.new(pvalues)
 	/@item = Item.new(item_params)/
  	if @item.save
          params[:item_attachments]['image'].each do |a|
                  @item_attachment = @item.item_attachments.create!(:image => a)
          end
  		  redirect_to user_path(:id => params[:user_id])
	else
  		render :action => 'new'
	end	  	
end
	 
def update
  @user = User.find(params[:user_id])
  @item = Item.find(params[:id])
  if @item.update(item_params)
  		redirect_to user_path(:id => params[:user_id])
  else
    render 'edit'
  end
end

def destroy
    @user = User.find(params[:user_id])
 @item = Item.find(params[:id])
  @item.destroy
  redirect_to user_path(:id => params[:user_id])
end

private
def item_params
	    params.require(:item).permit(:item_name,:item_desc,:item_price,:category_id)
end
end
