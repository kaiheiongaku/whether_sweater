require 'rails_helper'

describe MunchiesFacade do
  it 'returns a Munchies object', :vcr do
    start = 'mcallen,tx'
    destination = 'harlingen,tx'
    food = 'burger'

    response = MunchiesFacade.destination_info(start, destination, food)
    expect(response).to be_a(Munchy)
  end
end
