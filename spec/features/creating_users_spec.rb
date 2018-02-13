require "rails_helper"

RSpec.feature "People can create new users" do 
  scenario "with valid attributes" do 
    visit "/"
    click_link "New User"
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amy@amazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamnotreallyamy"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "User was successfully created." 
  end
end

