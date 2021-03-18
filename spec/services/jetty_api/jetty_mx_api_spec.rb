require 'rails_helper'

RSpec.describe JettyApi::JettyMxApi do
  describe "Initialize" do
    let(:user) { create(:user) }

    let(:driver) { create(:driver, user: user) }

    let(:params) do
      {
        email: driver.authentication_email,
        password: "secretsecret"
      }
    end

    context "when get token" do
      let(:obj) { described_class.new(params) }

      it "make request token success" do
        VCR.use_cassette 'request_token_success' do
          response = obj.get_token('/drivers/session')
          expect(response[:success]).to eql(true)
        end
      end

      it "return token" do
        VCR.use_cassette 'request_token_validation' do
          response = obj.get_token('/drivers/session')
          result = JSON.parse(response[:response].to_json)
          expect(result).to include("auth_token")
        end
      end
    end

    context "when get trips by driver" do
      let(:obj) { described_class.new(params) }

      it "make request token success" do
        VCR.use_cassette 'request_trips' do
          response_token = obj.get_token('/drivers/session')
          response_json = JSON.parse(response_token[:response].to_json)
          token = response_json["auth_token"]
          response_trips = obj.get_trips_by_driver(token, '/drivers/trips')
  
          expect(response_trips[:success]).to eql(true)
        end
      end

      it "return list of trips" do
        VCR.use_cassette 'request_trips' do
          response_token = obj.get_token('/drivers/session')
          response_json = JSON.parse(response_token[:response].to_json)
          token = response_json["auth_token"]
          response_trips = obj.get_trips_by_driver(token, '/drivers/trips')

          expect(response_trips[:response].count).to eql(0)
        end
      end
    end
  end
end
