class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]
  
  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id 
    
    if @sub.save 
      redirect_to sub_url(@sub)
    else 
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @current_sub
  end

  def update
    if @current_sub.update(sub_params)
      redirect_to sub_url(@current_sub)
    else
      flash[:errors] = @current_sub.errors.full_messages
      render :edit
    end
  end

  def show
    @current_sub = Sub.find(params[:id])
    @posts = @current_sub.posts
  end
  
  def require_moderator
    @current_sub = Sub.find(params[:id])
    redirect_to sub_url(@current_sub) unless @current_sub.moderator == current_user
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
end
