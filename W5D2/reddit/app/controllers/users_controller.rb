class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to subs_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
