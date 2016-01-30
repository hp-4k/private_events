class Event < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :invitations, foreign_key: 'attended_event_id'
  has_many :attendees, through: :invitations
  
  before_save :include_time
  
  validates_presence_of :title, :description, :location, :date
  
  default_scope -> { order(date: :desc) }
  scope :past, -> { where("date < ?", Time.now.strftime("%Y-%m-%d")) }
  scope :upcoming, -> { where("date >= ?", Time.now.strftime("%Y-%m-%d")) }
  
  attr_accessor :time
  
  def owner_name
    owner.name
  end
  
  private
  
    def include_time
      if time
        hours, minutes = time.split(':').map(&:to_i)
        self.date += hours.hours
        self.date += minutes.minutes
      end
    end
    
end
