require 'rails_helper'

describe RoadTripService do
  it 'returns the travel time', :vcr do
    breakdown = RoadTripService.travel_breakdown('new york, ny', 'los angeles, ca')

    expect(breakdown[:travel_time]).to eq('40:34:31')
    expect(breakdown[:latlon_at_end]).to eq({:lat=>34.052238, :lng=>-118.243344})
  end

  it 'returns the weather forecast for destination', :vcr do
    latlon = {:lat=>34.052238, :lng=>-118.243344}
    weather = RoadTripService.hourly_weather_at_eta(latlon)

    expect(weather).to be_an(Array)
    expect(weather.size).to eq(48)
  end
end
