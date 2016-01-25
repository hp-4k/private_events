class UsersController < ApplicationController
  
  before_action :require_login, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
    def require_login
      unless current_user
        flash[:warning] = "You need to log in to access this site"
        redirect_to login_url
      end
    end
  
end