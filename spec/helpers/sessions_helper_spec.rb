require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  
  let :alan do
    create(:alan)
  end
  
  let :ben do
    create(:ben)
  end
  
  describe '#log_in' do
    it "saves the user id in the session" do
      helper.log_in(alan)
      expect(session[:id]).to eq alan.id
    end
  end
  
  describe "#logged_in?" do
    
    it "returns true when the user is logged in" do
      helper.log_in(alan)
      expect(helper.logged_in?).to be true
    end
    
    it "returns false when the user is not logged in" do
      expect(helper.logged_in?).to be false
    end
    
  end
  
  describe "#current_user" do
    
    context "when the user is logged in" do
      
      it "returns the user" do
        helper.log_in(alan)
        expect(helper.current_user).to eq alan
      end
      
    end
    
    context "when the user is not logged in" do
      
      it "returns nil" do
        expect(helper.current_user).to be nil
      end
      
    end
    
  end
  
  describe "#current_user?" do
    
    it "returns true when the passed in user is the current user" do
      helper.log_in(alan)
      expect(current_user?(alan)).to be true
    end
    
    it "returns false when the passed in user is not the current user" do
      helper.log_in(ben)
      expect(current_user?(alan)).to be false
    end
    
  end
  
  describe "#log_out" do
    
    it "logs the user out" do
      alan = create(:alan)
      helper.log_in(alan)
      expect(current_user).to eq alan
      helper.log_out
      expect(current_user).to be nil
      expect(session[:id]).to be nil
    end
    
  end
  
end
