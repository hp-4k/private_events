module SessionsHelper
  
  def log_in(user)
    session[:id] = user.id
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def current_user
    return nil unless session[:id]
    User.find_by(id: session[:id])
  end
  
  def log_out
    session.delete(:id)
  end
  
end
