class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_uniqueness_of :api_key

  before_create :set_api_key

  def set_api_key
    until self.api_key
      self.api_key = SecureRandom.urlsafe_base64
    end
  end

  has_secure_password
end
