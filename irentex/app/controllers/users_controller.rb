class UsersController < ApplicationController

	def index
	  @user = User.find(params[:id])
	end
	
	def show
	  @user = User.find(params[:id])
	  @items = Item.findwithuser(params[:id])
	  @user_category = Category.find(@user.categories_id)
	end


	def uploadlogo
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "logo was successfully added :)"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "failed to update logo :("
			redirect_to user_path(@user.id)
		end	
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
	 
	 def edit
	  @user = User.find(params[:id])
	  @categories = Category.all
	end


	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "updated :)"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "failed :("
			redirect_to user_path(@user.id)
		end	
	end
	def destroy
	  @user = User.find(params[:id])

	  @user.destroy
	 
	  redirect_to home_index_path
	end
	private
	  def user_params
	    params.require(:user).permit(:usr_vname,:usr_description,:usr_email,:password, :password_confirmation,:usr_tel,:usr_address,:usr_gover,:categories_id, :usr_logo,:usr_delivery)
	  end

end
