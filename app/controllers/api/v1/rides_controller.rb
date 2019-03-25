class Api::V1::RidesController < ApplicationController

  def index
    @rides=Ride.all
    render json: @rides
  end

  def show
    @ride = get_ride
  end

  def create
    @ride = Ride.create(ride_params)
    render json: @ride
  end

  def update
    @ride = get_ride.update(ride_params)
    render json:@ride

  end

  private
  def get_ride
    @ride=Ride.find(params[:id])
  end

  def ride_params
    params.require(:rides).permit(:name)
  end


end
