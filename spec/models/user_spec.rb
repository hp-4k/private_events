require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }
  
  let(:user) do
    build(:user)
  end
  
  describe '#name' do
    it "should not be blank" do
      user.name = ' ' * 50
      expect(user).not_to be_valid
    end
    
    it "should be present" do
      user.name = nil
      expect(user).not_to be_valid
    end
    
    it "should be minimum 3 characters long" do
      user.name = "ab"
      expect(user).not_to be_valid
    end
    
    it "should be unique" do
      create(:user) # save another copy of user to the database
      expect(user).not_to be_valid
    end
  end
  
  describe "#password" do
    it "should be minimum 6 characters long" do
      user.password = user.password_confirmation = "fooba"
      expect(user).not_to be_valid
    end
    
    it "should be present on creation" do
      user.password = user.password_confirmation = nil
      expect(user).not_to be_valid
    end
    
    it "should not be required on an existing user" do
      build(:user).save
      user = User.first
      expect(user).to be_valid
    end
  end
  
end
