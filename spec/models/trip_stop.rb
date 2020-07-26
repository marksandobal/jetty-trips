require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should belong_to(:trip) }
end
