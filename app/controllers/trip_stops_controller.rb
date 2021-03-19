# frozen_string_literal: true

# return list to trip stops of specified trip
class TripStopsController < ApplicationController
  def index
    trip = Trip.find(params[:id])
    @trip_stops = trip.trip_stops
  end
end
