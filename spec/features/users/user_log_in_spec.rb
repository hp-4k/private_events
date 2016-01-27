require 'rails_helper'
require 'capybara/rails'

RSpec.feature "User log in", type: :feature do
  
  before(:each) do
    @alan = create(:alan)
  end
  
  scenario "successful log in" do
    visit login_path
    fill_in "Name", with: @alan.name
    fill_in "Password", with: @alan.password
    click_button "Log in"
    
    expect(page).to have_text(@alan.name)
    expect(page).to have_link("Log out")
  end
  
  scenario "unsuccessful log in" do
    visit login_path
    fill_in "Name", with: 'junk'
    fill_in "Password", with: 'junk'
    click_button "Log in"
    
    expect(page).to have_text("Invalid")
    expect(page).to have_link("Log in")
  end
  
end