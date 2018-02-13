require "rails_helper"

RSpec.feature "Users can create their own new tasks" do
  before do
    user = FactoryGirl.create(
      :user, 
      first_name: "Bo", 
      email: "boburnham@yt.com", 
      password: "hashtagdeep",
      daily_hours: 4
    )
    visit user_path(user)
    click_link "New Task"
  end

  scenario "with valid attributes and all fields completed" do
    fill_in "Description", with: "Write new song"
    select "Medium", from => "Priority"
    fill_in "Estimated Duration", with: 3600   #in seconds for now, need to find alternative
    fill_in "Due date", with: Date.today.strftime('%Y-%m-%d')
    click_button "Create Task"
    expect(page).to have_content "Task was successfully created."
  end

  scenario "with valid attributes but no estimated duration" do 
    fill_in "Description", with: "Write new song"
    select "Medium", from => "Priority"
    fill_in "Due date", with: Date.today.strftime('%Y-%m-%d')
    click_button "Create Task"
    expect(page).to have_content "Task was successfully created."
  end

  scenario "with valid attributes but no due date" do
    fill_in "Description", with: "Write new song"
    select "Medium", from => "Priority"
    fill_in "Estimated Duration", with: 3600   #in seconds for now, need to find alternative
    click_button "Create Task"
    expect(page).to have_content "Task was successfully created."
  end

  scenario "with no description" do
    select "Medium", from => "Priority"
    fill_in "Estimated Duration", with: 3600   #in seconds for now, need to find alternative
    fill_in "Due date", with: Date.today.strftime('%Y-%m-%d')
    click_button "Create Task"
    expect(page).to have_content "prohibited this user from being saved"
    expect(page).to have_content "Description can't be blank"
  end
  
end

