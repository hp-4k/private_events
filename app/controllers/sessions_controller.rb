class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:warning] = "Invalid user name or password"
      render :new
    end
  end
  
  def destroy
    log_out
    flash[:success] = "Successfully logged out"
    redirect_to root_url
  end
  
end
