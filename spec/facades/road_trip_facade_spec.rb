require 'rails_helper'

describe RoadTripFacade do
  it 'creates a RoadTrip', :vcr do
    trip = RoadTripFacade.generate_roadtrip('new york, ny', 'los angeles, ca')

    expect(trip).to be_a(RoadTrip)
  end
end
