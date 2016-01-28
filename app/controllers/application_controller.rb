class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
      
    def require_login
      unless current_user
        flash[:danger] = "You need to log in to access this site"
        redirect_to login_url
      end
    end
  
end
