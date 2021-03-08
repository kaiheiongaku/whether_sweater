class FoodFacade
  class << self
    def pull_restaurant(location, food)
      endpoint = '/v3/businesses/search?'
      params = { location: location,
                 term: food,
                 limit: 1,
                 open_now: true}
      response = FoodService.call_restaurant_db(endpoint, params)
      Restaurant.new(response)
    end
  end
end
