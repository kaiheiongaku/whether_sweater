class FoodService
  class << self
    def call_restaurant_db(endpoint, params = {})
      response = connection.get(endpoint) do |request|
        request.params = params
        request.headers['Authorization'] = "Bearer #{ENV['Restaurant_api_key']}"
      end
      JSON.parse(response.body, symbolize_names: true)[:businesses][0]
    end

    private
    def connection
      Faraday.new('https://api.yelp.com')
    end
  end
end
