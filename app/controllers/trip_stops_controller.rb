class TripStopsController < ApplicationController
  def index
    trip = Trip.find(params[:id])
    @trip_stops = trip.trip_stops
  end
end
