module TripsHelper
  def first_stop
    @trip_stops.first
  end

  def last_stop
    @trip_stops.last
  end

  def trip_stops(stops)
    @trip_stops = stops.order(created_at: :asc)
  end
end
