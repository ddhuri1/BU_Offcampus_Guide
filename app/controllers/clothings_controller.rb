class ClothingsController < ApplicationController
    # GET method to get all products from database   
  def index   
    @clothings = Clothing.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @clothing = Clothing.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @clothing = Clothing.new   
  end   
   
  # POST method for processing form data   
  def create   
    @clothing = Clothing.new(clothings_params)   
    if @clothing.save   
      flash[:notice] = 'Store added!'   
      redirect_to clothings_path  
    else   
      flash[:error] = 'Failed to edit store!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @clothing = Clothing.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @clothing = Clothing.find(params[:id])   
    if @clothing.update_attributes(clothings_params)   
      flash[:notice] = 'Store updated!'   
      redirect_to clothings_path     
    else   
      flash[:error] = 'Failed to edit store!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @clothing = Clothing.find(params[:id])   
    @clothing.destroy   
      flash[:notice] = 'Store deleted!'   
      redirect_to clothings_path     
    # else   
    #   flash[:error] = 'Failed to delete this store!'   
    #   render :destroy   
    # end   
  end   
   
  # we used strong parameters for the validation of params   
  def clothings_params   
    params.require(:clothing).permit(:name, :review, :address, :website)   
  end   
   

end
