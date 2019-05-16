class GroceriesController < ApplicationController
    
      # GET method to get all products from database   
  def index   
    @groceries = Grocery.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @grocery = Grocery.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @grocery = Grocery.new   
  end   
   
  # POST method for processing form data   
  def create   
    @grocery = Grocery.new(groceries_params)   
    if @grocery.save   
      flash[:notice] = 'Store added!'   
      redirect_to groceries_path   
    else   
      flash[:error] = 'Failed to edit store!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @grocery = Grocery.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @grocery = Grocery.find(params[:id])   
    if @grocery.update_attributes(groceries_params)   
      flash[:notice] = 'Store updated!'   
      redirect_to groceries_path 
    else   
      flash[:error] = 'Failed to edit store!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @grocery = Grocery.find(params[:id])   
    #if @grocery.destroy
    @grocery.destroy
      flash[:notice] = "Store deleted!"
      redirect_to groceries_path   
    #else   
    #  flash[:error] = 'Failed to delete this store!'   
    #  render :destroy   
    #end   
  end   
  
  # we used strong parameters for the validation of params   
  def groceries_params   
    params.require(:grocery).permit(:name, :review, :address, :website)   
  end   
end
