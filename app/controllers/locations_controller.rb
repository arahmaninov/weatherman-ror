class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :set_location

  def index
    # all locations
    @locations = Location.all
  end

  def show
    # specific location
    @location = Location.find(params[:id])
  end

  def new
    # get a form to create a new location
    @location = Location.new
  end

  def create
    # create a new location from the data in 'new'
    Location.create(
      name: params[:name],
      temperature: params[:temperature],
      user_id: params[:user_id],
    )

    redirect_to '/'

=begin
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: "Location was successfully added." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
=end

  end

  def edit
    # get a form to update a location
  end

  def update
    # update a location from the data in 'edit'
    @location = Location.find(params[:id])
    @location.update(
      name: params[:name],
      temperature: params[:temperature],
      user_id: params[:user_id],
    )
  end

  def destroy
    # delete a location
    @location = Location.find(params[:id])
    @location.destroy
  end

  private 
    #def set_location
    #  @location = Location.find(params[:id])
    #end
=begin
    def location_params
      params.require(:location).permit(:name, :temperature, :user_id)
    end
=end

end
