class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      log_in!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    logout
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
