class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:create, :new]
  
  def new
    
  end 
  
  def create
    user = User.find_by_credentials(
      session_params[:username], session_params[:password])
    if user
      login(user)
      redirect_to cats_url
    else
      redirect_to new_session_url
    end
  end 
  
  def destroy
    if current_user
      current_user.reset_session_token!
      @current_user = nil
      session[:session_token] = nil
    end
    redirect_to cats_url
  end
  
  def session_params
    params.require(:session).permit(:username, :password)
  end
  
end 