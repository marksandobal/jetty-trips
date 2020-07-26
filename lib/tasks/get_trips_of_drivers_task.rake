namespace :get_trips_of_drivers_task do
  desc "Get trips by drivers since jetty api"
  task :trip_by_drivers => :environment do
    errors = []

    Driver.find_each do |driver|
      user     = driver.user
      email    = driver.authentication_email
      password = "secretsecret" # Cambiar por user.password

      jetty_api = JettyApi::JettyMxApi.new(
        email: email,
        password: password
      )

      response = jetty_api.get_token('/drivers/session')
      if response[:success]
        token  = response[:response][:auth_token]
        result = jetty_api.get_trips_by_driver(token, '/drivers/trips')

        trips  = result[:response]
        ActiveRecord::Base.transaction do
          trips.each do |trip|
            new_trip   = format_trip(trip, driver)
            save_trip  = save_trip(new_trip)
            trip_stops = trip["trip_stops"]
  
            trip_stops.each do |trip_stop|
              new_trip_stop  = fromat_strip_stop(save_trip, trip_stop)
              save_trip_stop = save_trip_stop(new_trip_stop)
            end
          end
        end
      else
        errors << { email: email, error: response[:response].message, message: response[:response]["message"] }
      end
    end

    puts "========================"
    puts "#{errors.count} errors occurred while updating "
    puts "====== DETAILS ======"
    puts errors
  end
end


def format_trip(trip, driver)
  {
    driver_id: driver.id,
    date:     trip["date"],
    price:    trip["price"],
    name:     trip["name"],
    status:   trip["status"]
  }
end

def fromat_strip_stop(trip, trip_stop)
  {
    trip_id:        trip.id,
    name:           trip_stop["name"],
    latitude:       trip_stop["latitude"],
    longitude:      trip_stop["longitude"],
    address:        trip_stop["address"],
    departure_time: trip_stop["departure_time"],
    boarding:       trip_stop["boarding"]
  }
end

def save_trip(params)
  Trip.create(params)
end

def save_trip_stop(params)
  TripStop.create(params)
end
