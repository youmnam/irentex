class RentpsController < ApplicationController

def index
	  @rentp = Rentp.find(params[:id])
end

def show
	  @rentp = Rentp.find(params[:id])
	  @item  = @rentp.items.all
      
end

def new
	@user = User.find(params[:user_id])
end
 
def create
	@user = User.find(params[:user_id])
	@user.rentps.create(rentp_params)
 	@rentp = Rentp.new(rentp_params)	  	
  	if @rentp.save
  		redirect_to user_path(@user.id)
	else
  		render :action => 'new'
	end	  	
end
	 
def destroy
  @rentp = Rentp.find(params[:id])
  @rentp.destroy
  redirect_to user_path(@user.id)
end

private
def rentp_params
	    params.require(:rentp).permit(:rp_address,:rp_gover)
end

end