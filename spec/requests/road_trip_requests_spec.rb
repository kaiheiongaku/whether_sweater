require 'rails_helper'

describe 'road trip requests' do
  describe 'post to road trip' do
    describe 'happy path' do
      it 'returns a road trip', :vcr do
        user = User.create!(email: 'me@me.com', password: 'Turingrocks')
        headers = { 'ACCEPT' => 'application/json' }
        params = { 'road_trip': { 'origin': "mcallen,tx",
                   'destination': "harlingen,tx",
                   'api_key': "#{user.api_key}" } }

        post '/api/v1/road_trip', params: params, headers: headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq(201)

        road_trip = JSON.parse(response.body, symbolize_names: true)

        expect(road_trip).to be_a(Hash)
        expect(road_trip).to have_key(:data)
        expect(road_trip[:data].keys).to eq([:id, :type, :attributes])
        expect(road_trip[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
        expect(road_trip[:data][:attributes][:weather_at_eta].keys).to eq([:temperature, :conditions])
        expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      end
    end

    describe 'sad path' do
      it 'returns an error if api key is incorrect' do
        user = User.create!(email: 'me@me.com', password: 'Turingrocks')
        headers = { 'ACCEPT' => 'application/json' }
        params = { 'road_trip': { 'origin': "mcallen,tx",
                   'destination': "harlingen,tx",
                   'api_key': "#{123}" } }

        post '/api/v1/road_trip', params: params, headers: headers

        expect(response.status).to eq(401)

        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq('Something went awry.')
      end

      it 'returns an error if there is no origin', :vcr do
        user = User.create!(email: 'me@me.com', password: 'Turingrocks')
        headers = { 'ACCEPT' => 'application/json' }
        params = { 'road_trip': {
                   'destination': "harlingen,tx",
                   'api_key': "#{user.api_key}" } }

        post '/api/v1/road_trip', params: params, headers: headers

        expect(response.status).to eq(401)

        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq('Something went awry.')
      end

      it 'returns an error if there is no destination' do
        user = User.create!(email: 'me@me.com', password: 'Turingrocks')
        headers = { 'ACCEPT' => 'application/json' }
        params = { 'road_trip': { 'origin': "mcallen,tx",
                   'api_key': "#{user.id}" } }

        post '/api/v1/road_trip', params: params, headers: headers

        expect(response.status).to eq(401)

        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq('Something went awry.')
      end
    end
  end
end
