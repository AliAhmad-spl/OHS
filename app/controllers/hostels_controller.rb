class HostelsController < ApplicationController
  before_action :set_hostel, only: [:show, :edit, :update, :destroy]

  # GET /hostels
  def index
    @hostels = Hostel.all
  end

  # GET /hostels/1
  def show
  end

  # GET /hostels/new
  def new
    @hostel = Hostel.new
  end

  # GET /hostels/1/edit
  def edit
  end

  # POST /hostels
  def create
    @hostel = Hostel.new(hostel_params)

    if @hostel.save
      redirect_to @hostel, notice: 'Hostel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hostels/1
  def update
    if @hostel.update(hostel_params)
      redirect_to @hostel, notice: 'Hostel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hostels/1
  def destroy
    @hostel.destroy
    redirect_to hostels_url, notice: 'Hostel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hostel
      @hostel = Hostel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hostel_params
      params.require(:hostel).permit(:name, :address, :phone, :city, :town, :street, :near_by, :owner_name, :image, :user_id, :status, :price, :air_conditioned)
    end
end
