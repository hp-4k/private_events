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
    
    before(:each) do
      @user = create(:user)
    end
    
    it "assign the correct user to @user" do
      get :show, id: @user
      expect(assigns(:user)).to eq @user
    end
    
    it "renders the :show view" do
      get :show, id: @user
      expect(response).to render_template :show
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
