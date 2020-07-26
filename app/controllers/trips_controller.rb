class TripsController < ApplicationController
  def index
    user   = current_user
    driver = Driver.find_by(user_id: user.id)
    @trips = Trip.where(driver: driver)
    @trip_per_days = @trips.group_by{ |trip| trip.date }
  end
end
