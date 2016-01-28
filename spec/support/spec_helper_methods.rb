module SpecHelperMethods
  
  def log_in_with_ui_as(user)
    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Log in"
  end
  
end