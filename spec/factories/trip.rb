FactoryBot.define do
    factory :trip do
      driver
      date { DateTime.now }
      price { Faker::Number.decimal(l_digits: 2) }
      name { Faker::Address.city }
      status { "created" }
    end
  end