require 'rails_helper'

RSpec.describe TripStopsController, type: :controller do
  login_user

  describe "GET #index" do
    let(:driver) { create(:driver, user: @user) }

    let(:trip) { create(:trip, driver: driver) }

    it "return a 200 status code" do
      get :index, params: { id: trip.id }
      expect(response.status).to eq(200)
    end

    it "render index template" do
      get :index, params: { id: trip.id }
      expect(response).to render_template(:index)
    end
  end
end
