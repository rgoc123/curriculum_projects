class CatRentalRequestsController < ApplicationController

  def index
    @cat = Cat.find(params[:cat_id])
    @cat_rentals = @cat.cat_rental_requests.order(end_date: :desc)
  end
  
  def show
    redirect_to cat_cat_rental_requests_url
  end
  
  def create
    cat_rental = CatRentalRequest.new(cat_rental_params)
    
    if cat_rental.save 
      redirect_to cat_cat_rental_requests_url
    else 
      render plain: cat_rental.errors.full_messages
    end
  end
  
  def new
    @cats = Cat.all
    @cat_rental = CatRentalRequest.new
  end
  
  def update
    cat_rental = CatRentalRequest.find(params[:id])
    
    if cat_rental.update_attributes(cat_rental_params)
      redirect_to cat_cat_rental_requests_url
    else 
      redirect_to edit_cat_rental_request
    end 
  end
  
  def edit
    @cats = Cat.all
    @cat_rental = CatRentalRequest.find(params[:id])
  end
  
  def destroy
    CatRentalRequest.find(params[:id]).destroy
    redirect_to cat_cat_rental_requests_url
  end
  
  private
  
  def cat_rental_params
    params.require(:cat_rental).permit(:cat_id, :start_date, :end_date, :status)
  end

end