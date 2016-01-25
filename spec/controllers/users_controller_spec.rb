require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "GET #new" do
  
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
    
    it "renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
    
  end
  
  describe "GET #show" do
    
    context "with a logged in user" do
    
      before(:each) do
        @user = create(:user)
        log_in(@user)
        get :show, id: @user
      end
      
      it "assign the correct user to @user" do
        expect(assigns(:user)).to eq @user
      end
      
      it "renders the :show view" do
        expect(response).to render_template :show
      end
      
    end
    
    context "with a logged out user" do
      
      before :each do
        @user = create(:user)
        get :show, id: @user
      end

      it "redirects to the log in page" do
        expect(response).to redirect_to login_url
      end
      
      it "sets the flash" do
        expect(flash).not_to be_empty
      end
    end
    
  end
  
  describe "POST #create" do
    
    context "with valid data" do
    
      it "creates a new user" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change { User.count }.by(1)
      end
      
      it "redirects to the new user page" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to User.last
      end
      
    end
    
    context "with invalid data" do
      
      it "does not create a new user" do
        expect {
          post :create, user: attributes_for(:invalid_user)
        }.not_to change { User.count }
      end
      
      it "renders the :new view" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
      
    end
    
  end
end
