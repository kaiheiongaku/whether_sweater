require 'rails_helper'

describe Background do
  describe 'object creation' do
    it 'exists and has attributes' do
      background_file = File.read('spec/fixtures/poros/background_spec.json')
      background_data = JSON.parse(background_file, symbolize_names: true)

      image = Background.new('los angeles,ca', background_data)

      expect(image).to be_a(Background)
      expect(image.location).to eq('los angeles,ca')
      expect(image.url).to eq('https://unsplash.com/photos/Zvnf63bvOxk')

      expect(image.credit).to be_a(Hash)
      expect(image.credit[:profile]).to eq('https://unsplash.com/@rpnickson')
      expect(image.credit[:author]).to eq("Roberto Nickson")
    end
  end
end
