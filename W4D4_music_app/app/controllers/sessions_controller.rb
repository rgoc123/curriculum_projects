class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    
    user = User.find_by_credentials(email, password)
    
    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else 
      flash[:error] = 'You have not signed up for SOUNDHOUSE'
      redirect_to new_user_url
    end
  end
  
  def destroy
    log_out!(current_user)
    redirect_to new_session_url
  end

end 