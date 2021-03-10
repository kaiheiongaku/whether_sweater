class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, info)
    @start_city = origin
    @end_city = destination
    @travel_time = convert_time(info[:travel_time])
    @weather_at_eta = weather(info[:hourly_weather_at_end])
  end

  def convert_time(time)
    if time
      "#{time[0..1]} hours, #{time[2..3]} minutes"
    else
      "impossible route"
    end
  end

  def weather(hourly_weathers)
    end_weather = {}
    hourly = HourlyWeather.new(hourly_weathers[rounded_hours_until_arrival])
    end_weather[:temperature] = hourly.temperature
    end_weather[:conditions] = hourly.conditions
    end_weather
  end

  def rounded_hours_until_arrival
    if @travel_time == 'impossible route'
      0
    else
      (@travel_time[0..1].to_i * 60 + @travel_time[10..11].to_i) / 60
    end
  end
end
