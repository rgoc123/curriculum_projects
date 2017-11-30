class UsersController < ApplicationController
  def new
    render :new
  end 
  
  def create
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user
    end
  end 
  
  def show
    @user = current_user
    # if current_user
    #   redirect_to user_url(current_user)
    # else
    #   flash[:errors] = 'Please login'
    #   redirect_to new_session_url
    # end
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end