class RentpNormalsController < ApplicationController
	def show
		  @rentp = Rentp.find(params[:id])
		  @items  = @rentp.items.all
		  @item_attachments = []
		  @items.each do |i|
		  	 	@item_attachments << i.item_attachments.all.fetch(0)	
		  end
	end
	def index
		@item  = Item.find(params[:iid])
		@rentp = Rentp.find(@item.rentp_id)
		@owner = User.find(@rentp.user_id)
	end

end
