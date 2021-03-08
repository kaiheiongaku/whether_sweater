class MapFacade
  class << self
    def retrieve_latlon(location)
      endpoint = '/geocoding/v1/address?'
      params = { location: location }
      response = MapService.call_map_db(endpoint, params)
    end

    def retrieve_travel_time(start, destination)
      endpoint = '/directions/v2/route?'
      params = { from: start,
                 to: destination
               }
      response = MapService.call_directions_db(endpoint, params)[:route][:formattedTime]
    end
  end
end
