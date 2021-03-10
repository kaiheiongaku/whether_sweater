require 'rails_helper'

describe Restaurant do
  it 'exists and has attributes' do
    hash = {
            "id": "SrHsmBvQlU024zZT7Vjgfw",
            "alias": "frankie-flav-s-craft-burger-house-harlingen",
            "name": "Frankie Flav’s Craft Burger House",
            "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/r0sRPK6P84qENBPq-jph3A/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/frankie-flav-s-craft-burger-house-harlingen?adjust_creative=Gq9gbQnvEHSbOhWZ2bZRIQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=Gq9gbQnvEHSbOhWZ2bZRIQ",
            "review_count": 28,
            "categories": [
                {
                    "alias": "newamerican",
                    "title": "American (New)"
                },
                {
                    "alias": "gastropubs",
                    "title": "Gastropubs"
                },
                {
                    "alias": "burgers",
                    "title": "Burgers"
                }
            ],
            "rating": 4.0,
            "coordinates": {
                "latitude": 26.199145,
                "longitude": -97.681261
            },
            "transactions": [
                "delivery",
                "pickup"
            ],
            "location": {
                "address1": "711 N 77 Sunshine Strip",
                "address2": "",
                "address3": 'null',
                "city": "Harlingen",
                "zip_code": "78550",
                "country": "US",
                "state": "TX",
                "display_address": [
                    "711 N 77 Sunshine Strip",
                    "Harlingen, TX 78550"
                ]
            },
            "phone": "+19562305050",
            "display_phone": "(956) 230-5050",
            "distance": 1412.3564370952188
        }
    rest = Restaurant.new(hash)
    expect(rest.name).to eq("Frankie Flav’s Craft Burger House")
    expect(rest.address).to eq("711 N 77 Sunshine Strip Harlingen, TX 78550")
  end
end
