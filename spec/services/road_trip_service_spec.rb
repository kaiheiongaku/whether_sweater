require 'rails_helper'

describe RoadTripService do
  it 'returns the travel time', :vcr do
    time = RoadTripService.travel_time('new york, ny', 'los angeles, ca')

    expect(time).to eq('40:34:31')
  end
end
