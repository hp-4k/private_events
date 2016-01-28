class Event < ActiveRecord::Base
  before_save :include_time
  
  belongs_to :owner, class_name: "User"
  
  validates_presence_of :title, :description, :location, :date
  
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
