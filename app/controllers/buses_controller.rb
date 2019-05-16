class BusesController < ApplicationController
    # GET method to get all products from database   
  def index   
    @buses = Bus.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @bus = Bus.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @bus = Bus.new   
  end   
   
  # POST method for processing form data   
  def create   
    @bus = Bus.new(bus_params)   
    if @bus.save   
      flash[:notice] = 'Bus added!'   
      redirect_to buses_path   
    else   
      flash[:error] = 'Failed to edit bus!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @bus = Bus.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @bus = Bus.find(params[:id])   
    if @bus.update_attributes(bus_params)   
      flash[:notice] = 'Bus updated!'   
      redirect_to buses_path    
    else   
      flash[:error] = 'Failed to edit bus!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @bus = Bus.find(params[:id])   
    @bus.destroy   
      flash[:notice] = 'Bus deleted!'   
      redirect_to buses_path    
    # else   
    #   flash[:error] = 'Failed to delete this bus!'   
    #   render :destroy   
    # end   
  end   
   
  # we used strong parameters for the validation of params   
  def bus_params   
    params.require(:bus).permit(:name, :review, :address, :website)   
  end   
   

end
