require "rails_helper"

RSpec.feature "People can create new users" do 
  before do
    visit "/"
    click_link "New User"
  end
  scenario "with valid attributes" do 
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amy@amazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamnotreallyamy"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "User was successfully created." 
  end

  scenario "with invalid email" do
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amyamazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamnotreallyamy"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "Email is invalid" 
  end

  scenario "with no name" do
    fill_in "Email", with: "amyamazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamnotreallyamy"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "First name can't be blank"
  end

  scenario "with no password" do
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amyamazingamy.com"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "with mismatching passwords" do 
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amy@amazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamreallyamy"
    fill_in "Daily hours", with: 5 
    click_button "Create User"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "with invalid work hours" do 
    fill_in "First Name", with: "Amy"
    fill_in "Email", with: "amy@amazingamy.com"
    fill_in "Password", with: "iamnotreallyamy"
    fill_in "Password Confirmation", with: "iamnotreallyamy"
    fill_in "Daily hours", with: -5 
    click_button "Create User"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "Available daily work hours need to be greater than 0 and less than or equal to 24"
  end
end

