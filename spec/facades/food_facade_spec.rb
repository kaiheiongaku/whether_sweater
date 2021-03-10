require 'rails_helper'

describe FoodFacade do
  it 'returns a restaurant item', :vcr do

    restaurant = FoodFacade.pull_restaurant('harlingen,tx', 'burger')

    expect(restaurant).to be_a(Restaurant)
    expect(restaurant.name).to be_a(String)
    expect(restaurant.address).to be_a(String)
  end
end
