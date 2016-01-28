require 'rails_helper'

RSpec.describe Event, type: :model do
  include EventsHelper
  
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :location }
  it { is_expected.to validate_presence_of :description }
  
  describe "date" do
    
    it "contains concatenated date and time parameters" do
      time = "12:31"
      date = "2016-02-03"
      event = build(:event, time: time, date: date)
      event.save
      event.reload
      expect(format_date(event.date)).to eq "03 February 2016 12:31"
    end
    
  end
end
