class ItemsController < ApplicationController
	def index
	  @item = Item.find(params[:id])
    @item_attachment = @item.item_attachments.all
end

def show
	  @item = Item.find(params[:id])
end

def new
	@rentp = Rentp.find(params[:rentp_id])
  @item  = @rentp.items.build
  @item_attachment = @item.item_attachments.build
  
end
 
def create
	@rentp = Rentp.find(params[:rentp_id])
	@item = @rentp.items.create(item_params)
 	/@item = Item.new(item_params)/
  	if @item.save
        params[:item_attachments]['image'].each do |a|
          @item_attachment = @item.item_attachments.create!(:image => a)
        end
  		redirect_to user_rentp_path(:id => @rentp.id)
	else
  		render :action => 'new'
	end	  	
end
	 
def update
  @rentp = Rentp.find(params[:rentp_id])
  @item = Item.find(params[:id])
  if @item.update(item_params)
  		redirect_to user_rentp_path(:id => @rentp.id)
  else
    render 'edit'
  end
end

def destroy
  @rentp = Rentp.find(params[:rentp_id])
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to user_rentp_path(:id => @rentp.id)
end

private
def item_params
	    params.require(:item).permit(:item_name,:item_desc,:item_price)
end
end
