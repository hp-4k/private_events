require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    
    it "renders the login page" do
      get :new
      expect(response).to render_template :new
    end
    
  end
  
  describe "POST #create" do
    
    context "with valid credentials" do
      
      before :each do
        @alan = create(:alan)
        post :create, session: { name: @alan.name, password: @alan.password }
      end
      
      it "logs the user in" do
        expect(current_user).to eq @alan
      end
      
      it "redirect to user's profile" do
        expect(response).to redirect_to @alan
      end
      
    end
    
    context "with invalid credentials" do
      
      before :each do
        create(:alan)
        post :create, session: { name: 'junk', password: 'junkjunk' }
      end
      
      it "render the :new template" do
        expect(response).to render_template :new
      end
      
      it "sets the flash" do
        expect(flash).not_to be_empty
      end
      
    end
    
  end
  
  describe "DELETE #destroy" do

    context "when the user is logged in" do
    
      before :each do
        @alan = create(:alan)
        log_in(@alan)
        delete :destroy
      end
      
      it "logs out the current user" do
        expect(logged_in?).to be false
      end
      
      it "redirects to root" do
        expect(response).to redirect_to root_url
      end
      
      it "sets the flash" do
        expect(flash).not_to be_empty
      end
    
    end
    
    context "when the user is logged out" do
      
      it "redirects to root" do
        
      end
      
    end

  end

end
