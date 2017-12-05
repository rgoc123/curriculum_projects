class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :auth_token
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def ensure_login
    redirect_to new_session_url unless current_user
  end
  
  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def logout
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
    redirect_to new_session_url
  end
  
  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end
end
