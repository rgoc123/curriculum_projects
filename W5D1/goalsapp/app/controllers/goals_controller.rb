class GoalsController < ApplicationController
  def new

  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id 
    
    if @goal.save
      flash[:success] = ['Goal saved!']
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    debugger
    @goal = current_user.goals.find_by(id: params[:id])
    debugger
    if @goal && @goal.update_attributes(goal_params)
      flash[:success] = ['Goal updated!']
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end 
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = current_user.goals
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:success] = ['Goal deleted!']
    redirect_to goals_url
  end
  
  private 
  def goal_params
    params.require(:goal).permit(:title, :body, :private, :complete)
  end
end
