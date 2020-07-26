FactoryBot.define do
  factory :driver do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.cell_phone }
    active { true }
    authentication_token { Faker::Internet.password }
    authentication_email { "driver+test100@example.com" }
  end
end
