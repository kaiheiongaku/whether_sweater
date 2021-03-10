require 'rails_helper'

describe FoodFacade do
  it 'returns a restaurant item', :vcr do

    restaurant = FoodFacade.pull_restaurant('harlingen,tx', 'burger')

    expect(restaurant).to be_a(Restaurant)
    expect(restaurant.name).to eq("Frankie Flav’s Craft Burger House")
    expect(restaurant.address).to eq("711 N 77 Sunshine Strip Harlingen, TX 78550")
  end
end
