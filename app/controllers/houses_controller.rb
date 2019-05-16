class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'address'
      ordering,@address_header = {:address => :asc}, 'hilite'
      if(sort == 'address')
        ordering = ordering.reverse_order
      end
    when 'rent'
      ordering,@rent_header = {:rent => :asc}, 'hilite'
      if(sort == 'rent')
        ordering = ordering.reverse_order
      end
    when 'beds'
      ordering,@beds_header = {:beds => :asc}, 'hilite'
      if(sort == 'beds')
        ordering = ordering.reverse_order
      end
    end
    if params[:sort] != session[:sort]
      session[:sort] = sort
      redirect_to :sort => sort and return
    end
    @houses = House.all.order(ordering)
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:address, :landlord, :rent, :beds, :contact, :bathrooms, :further_details)
    end
end
