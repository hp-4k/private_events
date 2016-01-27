require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Creating a new user", type: :feature do
  
  let(:alan) do
    build(:alan)
  end
  
  scenario "successfully creating a new user" do
    visit root_url
    click_link 'Sign up'
    fill_in "Name", with: alan.name
    fill_in "Password", with: alan.password
    fill_in "Password confirmation", with: alan.password
    click_button 'Sign up'
    
    expect(page).to have_link('Log out')
    expect(page).to have_text(alan.name)
    expect(page).to have_selector('.alert-success')
  end
  
  scenario "unsuccessfully creating a new user" do
    visit new_user_path
    fill_in "Name", with: ''
    fill_in "Password", with: 'junk'
    fill_in "Password confirmation", with: "invalid confirmation"
    click_button "Sign up"
    
    within "h1" do
      expect(page).to have_content('Sign up')
    end
    expect(page).to have_selector('.alert-danger')
    within '.alert' do
      expect(page).to have_text 'errors'
    end
    
  end
  
end