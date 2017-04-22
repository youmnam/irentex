class ReservationsController < ApplicationController

	def create		
	 	@Reservation = Reservation.new(reserv_params)	  	
	  	if @Reservation.save
      		flash[:notice] = "Successfully Requested!"
      		redirect_to viewitem_path(:id => params[:id])
    	else
      		render :action => 'new'
    	end
	end

private
	  def reserv_params
	    params.require(:reservation).permit(:name,:email,:from,:to, :item_id)
	  end

end
