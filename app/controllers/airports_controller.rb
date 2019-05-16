class AirportsController < ApplicationController
    # GET method to get all products from database   
  def index   
    @airports = Airport.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @airport = Airport.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @airport = Airport.new   
  end   
   
  # POST method for processing form data   
  def create   
    @airport = Airport.new(airports_params)   
    if @airport.save   
      flash[:notice] = 'Airport added!'   
      redirect_to airports_path   
    else   
      flash[:error] = 'Failed to edit airport!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @airport = Airport.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @airport = Airport.find(params[:id])   
    if @airport.update_attributes(airports_params)   
      flash[:notice] = 'Airport updated!'   
      redirect_to airports_path   
    else   
      flash[:error] = 'Failed to edit airport!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @airport = Airport.find(params[:id])   
    @airport.destroy   
      flash[:notice] = 'Airport deleted!'   
      redirect_to airports_path   
    #else   
    #  flash[:error] = 'Failed to delete this airport!'   
    #  render :destroy   
    #end   
  end   
   
  # we used strong parameters for the validation of params   
  def airports_params   
    params.require(:airport).permit(:name, :review, :address, :website)   
  end   
   

end
