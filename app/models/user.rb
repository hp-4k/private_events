class User < ActiveRecord::Base
  has_many :events, foreign_key: 'owner_id'
  
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  has_secure_password
  
  # currently not used
  def self.generate_token
    SecureRandom.urlsafe_base64
  end
end
