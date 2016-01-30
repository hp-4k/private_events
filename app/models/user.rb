class User < ActiveRecord::Base
  has_many :events, foreign_key: 'owner_id'
  has_many :invitations, foreign_key: 'attendee_id'
  has_many :attended_events, through: :invitations
  
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  has_secure_password
end
