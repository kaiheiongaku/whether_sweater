class Munchy
  attr_reader :travel_time, :forecast, :restaurant, :destination_city
  def initialize(info, destination)
    @destination_city = destination
    @travel_time = rewrite_time(info[:travel_time])
    @forecast = info[:forecast]
    @restaurant = info[:restaurant]
  end

  def rewrite_time(time)
    "#{time[0..1]} hours, #{time[3..4]} minutes"
  end
end
