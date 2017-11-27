class UsersController < ApplicationController
  def index 
    render json: User.all
  end
  
  def show
    render json: User.find(params[:id])
  end
  
  def create 
    user = User.new(user_params)
    if user.save 
      render json: User.all
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    
    render json: user
  end
  
  def delete
    User.find(params[:id]).destroy
    
    render json: User.all 
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end