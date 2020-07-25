class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @trip_per_days = @trips.group_by{ |trip| trip.date.strftime("%d %B") }
  end
end
