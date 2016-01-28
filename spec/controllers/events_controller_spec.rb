require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  
  describe "GET #index" do
    
    before :each do
      @alan = create(:alan) do |user|
        3.times { user.events.create(attributes_for(:event)) }
      end
      create(:ben) do |user|
        2.times { user.events.create(attributes_for(:event)) }
      end
    end
    
    it "redirects to login page if user is not logged in" do
      get :index
      expect(response).to redirect_to login_path
    end
    
    it "assigns a collection of all events to @events" do
      log_in(@alan)
      get :index
      expect(assigns(:events).length).to eq 5
    end
    
  end
  
  describe "GET #new" do
    
    let(:alan) { create(:alan) }
    
    it "redirects to login page if user is not logged in" do
      get :new
      expect(response).to redirect_to login_path
    end
    
    it "assigns a new event owned by the current user to @event" do
      log_in(alan)
      get :new
      expect(assigns(:event)).to be_an Event
      expect(assigns(:event).owner).to eq alan
    end
    
  end
  
  describe "GET #show" do
    
    before :each do
      @alan = create(:alan)
      @event = @alan.events.create(title: 'title', description: 'description',
                                   location: 'location', date: '2016-07-02 12:30')
      
    end
    
    it "redirects to login page if user is not logged in" do
      get :show, id: @event
      expect(response).to redirect_to login_path
    end
    
    it "assign the requested event to @event" do
      log_in(@alan)
      get :show, id: @event
      expect(assigns(:event)).to eq @event
    end
    
  end
  
  describe "POST #create" do
    
    before :each do
      @owner = create(:owner)
      log_in(@owner)
    end
    
    context "with valid parameters" do
      
      it "creates a new event" do
        expect {
          post :create, event: attributes_for(:event) 
        }.to change { @owner.events.count }.by(1)
      end
      
      it "redirects to the event page" do
        post :create, event: attributes_for(:event) 
        expect(response).to redirect_to assigns(:event) 
      end
      
    end
    
    context "with invalid parameters" do
      
      it "does not create a new event" do
        expect {
          post :create, event: attributes_for(:event, title: '', description: '') 
        }.to_not change { @owner.events.count }
      end
      
      it "rerenders the new event form" do
        post :create, event: attributes_for(:event, title: '', description: '') 
        expect(response).to render_template :new
      end
      
      it "sets errors on the @event object" do
        post :create, event: attributes_for(:event, title: '', description: '') 
        expect(assigns(:event).errors).not_to be_empty
      end
      
    end
    
  end

end
