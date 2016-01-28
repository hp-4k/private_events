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
      log_in @user
      flash[:success] = "Your account was created. Welcome to Private Events."
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
