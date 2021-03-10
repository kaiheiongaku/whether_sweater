require 'rails_helper'

describe WeatherFacade, :vcr do
  it 'creates hourly weather objects' do
    weathers = [{clouds:90,
              dew_point:42.57,
              dt:1615384800,
              feels_like:42.64,
              humidity:87,
              pop:1,
              pressure:1018,
              rain:{"1h":0.87},
              temp:46.22,
              uvi:0,
              visibility:4892,
              weather:
               [{description:"light rain", icon:"10n", id:500, main:"Rain"}],
              wind_deg:232,
              wind_speed:3.33},
             {clouds:88,
              dew_point:42.75,
              dt:1615388400,
              feels_like:45.79,
              humidity:79,
              pop:0.79,
              pressure:1018,
              temp:48.96,
              uvi:0.29,
              visibility:10000,
              weather:
               [{description:"overcast clouds",
                 icon:"04d",
                 id:804,
                 main:"Clouds"}],
              wind_deg:308,
              wind_speed:2.66}]
    objects = WeatherFacade.create_hourly_weather(weathers)

    expect(objects).to be_an(Array)
    expect(objects.size).to eq(2)
    expect(objects.first).to be_an(HourlyWeather)
  end
end
