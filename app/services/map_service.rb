class MapService
  class << self
    def call_map_db(endpoint, params = {})
      response = connection.get(endpoint) do |request|
        request.params = params
        request.params[:key] = ENV['Map_api_key']
      end
      JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
    end

    def call_directions_db(endpoint, params = {})
      response = connection.get(endpoint) do |request|
        request.params = params
        request.params[:key] = ENV['Map_api_key']
      end
      JSON.parse(response.body, symbolize_names: true)[:route][:formattedTime]
    end

    private
    def connection
      Faraday.new('http://www.mapquestapi.com')
    end
  end
end
