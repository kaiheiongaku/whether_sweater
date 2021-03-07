class MapFacade
  class << self
    def retrieve_latlon(location)
    endpoint = '/geocoding/v1/address?'
    params = {location: location}
    response = MapService.call_map_db(endpoint, params)
    end
  end
end
