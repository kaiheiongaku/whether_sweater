require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'class methods' do
    it 'generates and saves an api key' do
      user = User.create(email: 'codingMaster@turing.io', password: 'T1m!s@w3s0me')

      expect(user.api_key).to be_a(String)
      expect(user.api_key.size).to eq(22)
    end
  end
end
