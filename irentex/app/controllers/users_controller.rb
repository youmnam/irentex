class UsersController < ApplicationController
def index
	  @user = User.find(params[:id])
	end
	def show
	  @user = User.find(params[:id])
	  @items = Item.findwithuser(params[:id])
	  @user_category = Category.find(@user.categories_id)
	end

	def new
	  @categories = Category.all
	end
 
	def create
		@categories = Category.all
	 	@user = User.new(user_params)	  	
	  	if @user.save
      		flash[:notice] = "Successfully sign up"
      		redirect_to user_path(@user.id)
    	else
      		render :action => 'new'
    	end
	  	
	end
	 
	def destroy
	  @user = User.find(params[:id])

	  @user.destroy
	 
	  redirect_to :action => "index"
	end
	private
	  def user_params
	    params.require(:user).permit(:usr_fname,:usr_lname,:usr_email,:password, :password_confirmation,:usr_tel,:usr_dob,:usr_address,:usr_gover,:categories_id)
	  end

end
