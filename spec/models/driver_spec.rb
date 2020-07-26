require 'rails_helper'

RSpec.describe Driver, type: :model do
  it { should have_many(:trips) }
  it { should belong_to(:user) }
end
