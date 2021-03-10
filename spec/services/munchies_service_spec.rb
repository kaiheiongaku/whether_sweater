require 'rails_helper'

describe MunchiesService do
  it 'returns a hash', :vcr do
    start = 'mcallen,tx'
    destination = 'harlingen,tx'
    food = 'burger'
    response = MunchiesService.travel_breakdown(start, destination, food)

    expect(response).to be_a(Hash)
    expect(response[:travel_time]).to eq('00:35:46')
    expect(response[:restaurant]).to be_a(Restaurant)
    expect(response[:forecast]).to be_a(Hash)
  end
end
