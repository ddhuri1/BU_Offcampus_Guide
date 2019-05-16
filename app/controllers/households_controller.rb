class HouseholdsController < ApplicationController
  
  # GET method to get all products from database   
  def index   
    @households = Household.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @household = Household.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @household = Household.new   
  end   
   
  # POST method for processing form data   
  def create   
    @household = Household.new(households_params)   
    if @household.save   
      flash[:notice] = 'Store added!'   
      redirect_to households_path   
    else   
      flash[:error] = 'Failed to edit store!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @household = Household.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @household = Household.find(params[:id])   
    if @household.update_attributes(households_params)   
      flash[:notice] = 'Store updated!'   
      redirect_to households_path   
    else   
      flash[:error] = 'Failed to edit store!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @household = Household.find(params[:id])   
    @household.destroy   
      flash[:notice] = 'Store deleted!'   
      redirect_to households_path  
    # else   
    #   flash[:error] = 'Failed to delete this store!'   
    #   render :destroy   
    # end   
  end   

    def households_params   
        params.require(:household).permit(:name, :review, :address, :website)   
    end 
end
