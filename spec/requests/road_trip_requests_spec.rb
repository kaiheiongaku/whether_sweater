require 'rails_helper'

describe 'road trip requests' do
  describe 'post to road trip' do
    describe 'happy path' do
      it 'returns a road trip' do
        user = User.create!(email: 'me@me.com', password: 'Turingrocks')
        headers = { 'ACCEPT' => 'application/json' }
        params = { 'road_trip': { 'origin': "mcallen,tx",
                   'destination': "harlingen,tx",
                   'api_key': "#{user.api_key}" } }

        post '/api/v1/road_trip', params: params, headers: headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq(201)

        road_trip = JSON.parse(response.body, symbolize_names: true)

        expect(parsed).to be_a(Hash)
        expect(parsed).to have_key(:data)
        expect(parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
        expect(:data[:attributes][:weather_at_eta].keys).to eq(:temperature, :conditions)
        expect(:data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      end
    end
  end
end
