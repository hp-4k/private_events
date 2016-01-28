require 'rails_helper'
require 'capybara/rails'

RSpec.feature "User log in", type: :feature do
  
  before(:each) do
    @alan = create(:alan)
  end
  
  scenario "successful log in" do
    log_in_with_ui_as(@alan)
    expect(page).to have_text(@alan.name)
    expect(page).to have_link("Log out")
  end
  
  scenario "unsuccessful log in" do
    log_in_with_ui_as(double(name: 'junk', password: 'junk'))
    
    # user is not logged in
    expect(page).to have_link("Log in")
    # flash message appears
    expect(page).to have_text("Invalid")
    
    # flash message disappears after valid login
    fill_in "Name", with: @alan.name
    fill_in "Password", with: @alan.password
    click_button "Log in"
    expect(page).not_to have_text("Invalid")
  end
  
end