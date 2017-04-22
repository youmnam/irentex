class SessionsController < ApplicationController
  
def loginrenter
end

 def createrenter
    renter = Renter.find_by(renter_email: params[:session][:email].downcase)
    if renter && renter.authenticate(params[:session][:password])
      redirect_to renter_path(renter)
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'loginrenter'
    end
  end

  def new
  end

  def create
    user = User.find_by(usr_email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
end
