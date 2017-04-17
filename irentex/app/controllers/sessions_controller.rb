class SessionsController < ApplicationController
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
