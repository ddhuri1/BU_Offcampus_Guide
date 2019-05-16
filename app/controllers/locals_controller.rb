class LocalsController < ApplicationController
    # GET method to get all products from database   
  def index   
    @locals = Local.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @local = Local.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @local = Local.new   
  end   
   
  # POST method for processing form data   
  def create   
    @local = Local.new(locals_params)   
    if @local.save   
      flash[:notice] = 'Store added!'   
      redirect_to locals_path  
    else   
      flash[:error] = 'Failed to edit local!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @local = Local.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @local = Local.find(params[:id])   
    if @local.update_attributes(locals_params)   
      flash[:notice] = 'Store updated!'   
      redirect_to locals_path   
    else   
      flash[:error] = 'Failed to edit local!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @local = Local.find(params[:id])   
    @local.destroy    
      flash[:notice] = 'Store deleted!'   
      redirect_to locals_path   
    # else   
    #   flash[:error] = 'Failed to delete this local!'   
    #   render :destroy   
    # end   
  end   
   
  # we used strong parameters for the validation of params   
  def locals_params   
    params.require(:local).permit(:name, :review, :address, :website)   
  end   
   

end
