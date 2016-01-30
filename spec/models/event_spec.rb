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
  
  describe "ordering" do  
    
    it "orders events from newest to oldest by default" do
      create(:alan) do |alan|
        @mid = alan.events.create(attributes_for(:event, date: "2016-02-14", time: "12:00"))
        @old = alan.events.create(attributes_for(:event, date: "2014-04-12"))
        @new = alan.events.create(attributes_for(:event, date: "2016-02-14", time: "20:15"))
      end
      expect(Event.all).to eq [@new, @mid, @old]
    end
  
  end
  
  describe "time scopes" do
  
    before :each do
      create(:alan) do |alan|
        @new = alan.events.create(attributes_for(:event, date: (Time.now + 1.year).strftime("%Y-%m-%d")))
        @old = alan.events.create(attributes_for(:event, date: (Time.now - 1.year).strftime("%Y-%m-%d")))
        @newest = alan.events.create(attributes_for(:event, date: (Time.now + 10.year).strftime("%Y-%m-%d")))
        @oldest = alan.events.create(attributes_for(:event, date: (Time.now - 10.year).strftime("%Y-%m-%d")))
      end
    end
  
    describe "#upcoming" do
      
      it "returns only events due to occur in the future" do
        expect(Event.upcoming).to eq [@newest, @new]
      end
      
    end
    
    describe "#past" do
      
      it "returns only events which occured in the past" do
        expect(Event.past).to eq [@old, @oldest]
      end
      
    end
  
  end
  
end
