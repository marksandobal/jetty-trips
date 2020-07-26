require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:trip_stops) }
  it { should belong_to(:driver) }
end
