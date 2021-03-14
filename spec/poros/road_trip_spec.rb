require 'rails_helper'

describe RoadTrip do
  it 'exists and has attributes' do
    file = File.read('spec/fixtures/poros/hourly.json')

    info = JSON.parse(file, symbolize_names: true)
    roadtrip = RoadTrip.new('new york, ny', 'los angeles, ca', info)

    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.start_city).to eq('new york, ny')
    expect(roadtrip.end_city).to eq('los angeles, ca')
    expect(roadtrip.travel_time).to be_a(String)

    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.weather_at_eta[:temperature]).to eq(51.96)
    expect(roadtrip.weather_at_eta[:conditions]).to eq('broken clouds')
  end
end
