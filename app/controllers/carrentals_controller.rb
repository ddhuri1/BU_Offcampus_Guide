class CarrentalsController < ApplicationController
    # GET method to get all products from database   
  def index   
    @carrentals = Carrental.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @carrental = Carrental.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @carrental = Carrental.new   
  end   
   
  # POST method for processing form data   
  def create   
    @carrental = Carrental.new(carrentals_params)   
    if @carrental.save   
      flash[:notice] = 'Car Rental added!'   
      redirect_to carrentals_path   
    else   
      flash[:error] = 'Failed to edit carrental!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @carrental = Carrental.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @carrental = Carrental.find(params[:id])   
    if @carrental.update_attributes(carrentals_params)   
      flash[:notice] = 'Car Rental updated!'   
      redirect_to carrentals_path   
    else   
      flash[:error] = 'Failed to edit Car Rental!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @carrental = Carrental.find(params[:id])   
    @carrental.destroy   
      flash[:notice] = 'Car Rental deleted!'   
      redirect_to carrentals_path   
    # else   
    #   flash[:error] = 'Failed to delete this carrental!'   
    #   render :destroy   
    # end   
  end   
   
  # we used strong parameters for the validation of params   
  def carrentals_params   
    params.require(:carrental).permit(:name, :review, :address, :website)   
  end   
   

end
