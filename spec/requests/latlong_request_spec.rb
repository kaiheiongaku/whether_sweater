require 'rails_helper'

describe 'request latitude and longitude' do
  it 'returns only the lattitude and longitude' do
    get '/api/v1/forecast?location=mcallen,tx'

    latlon = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to be_successful

    expect(latlong).to be_a(Hash)
    expect(latlon).to have_key(:lattitude)
    expect(latlon).to have_key(:longitude)
  end
end
