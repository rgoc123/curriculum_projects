class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :confirm_owner, :is_owner?
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def already_logged_in
    redirect_to cats_url if current_user
  end
  
  def confirm_owner
    unless current_user.id == current_cat.user_id
      redirect_to cat_url(current_cat.id)
    end
  end 
  
  def is_owner?
    current_user.id == @cat.user_id
  end 
  
end
