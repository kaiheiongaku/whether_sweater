class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(daily_info)
    @date     = Time.at(daily_info[:dt]).to_date.to_s
    @sunrise  = Time.at(daily_info[:sunrise]).to_time.to_s
    @sunset   = Time.at(daily_info[:sunset]).to_time.to_s
    @max_temp = daily_info[:temp][:max]
    @min_temp = daily_info[:temp][:min]
    @conditions = daily_info[:weather][0][:description]
    @icon       = daily_info[:weather][0][:icon]
  end
end
