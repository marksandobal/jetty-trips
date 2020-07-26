FactoryBot.define do
  factory :trip_stop do
    trip
    name { Faker::Address.city }
    latitude { Faker::Number.decimal_part(digits: 6) }
    longitude { Faker::Number.decimal_part(digits:6) }
    address { Faker::Address.full_address }
    departure_time { DateTime.now }
    boarding { true }
  end
end
