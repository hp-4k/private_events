class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  has_secure_password
end
