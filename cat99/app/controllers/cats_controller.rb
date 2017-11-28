class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def new
    @cat = Cat.new
  end
  
  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cat_url(cat)
    else
      render plain: cat.errors.full_messages
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
  end
  
  def update
    cat = Cat.find(params[:id])
    
    if cat.update_attributes(cat_params)
      redirect_to cat_url(cat)
    else
      redirect_to edit_cat(cat)
    end
    
  end
  
  def destroy
    Cat.find(params[:id]).destroy
  end
  
  private
  
  #Strong Params
  def cat_params #strictly for user input
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
  
end