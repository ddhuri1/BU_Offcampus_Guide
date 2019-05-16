class MedicalsController < ApplicationController
    # GET method to get all products from database   
  def index   
    @medicals = Medical.all  
  end   
   
  # GET method to get a product by id   
  def show   
    @medical = Medical.find(params[:id])   
  end   
   
  # GET method for the new product form   
  def new   
    @medical = Medical.new   
  end   
   
  # POST method for processing form data   
  def create   
    @medical = Medical.new(medicals_params)   
    if @medical.save   
      flash[:notice] = 'Medical added!'   
      redirect_to medicals_path   
    else   
      flash[:error] = 'Failed to create medical!'   
      render :new   
    end   
  end   
   
   # GET method for editing a product based on id   
  def edit   
    @medical = Medical.find(params[:id])   
  end   
   
  # PUT method for updating in database a product based on id   
  def update   
    @medical = Medical.find(params[:id])   
    if @medical.update_attributes(medicals_params)   
      flash[:notice] = 'Medical updated!'   
      redirect_to medicals_path   
    else   
      flash[:error] = 'Failed to edit medical!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @medical = Medical.find(params[:id])   
    @medical.destroy   
      flash[:notice] = 'Medical deleted!'   
      redirect_to medicals_path   
    # else   
    #   flash[:error] = 'Failed to delete this medical!'   
    #   render :destroy   
    # end   
  end   
   
  # we used strong parameters for the validation of params   
  def medicals_params   
    params.require(:medical).permit(:name, :review, :address, :website)   
  end   
   

end
