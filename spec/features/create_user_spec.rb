require 'rails_helper'
feature "guest user creates an account" do
  scenario "unsuccessfully creates a new user account" do
    visit "/users"
    fill_in "first_name", with: ""
    fill_in "last_name", with: ""
    fill_in "email", with: ""
    click_button "Create"
    expect(page).not_to have_content "Success!"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "First name is too short (minimum is 2 characters)"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Last name is too short (minimum is 2 characters)"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Email is invalid"
  end

  scenario "successfully creates a new user account" do
    new_user = build(:user)
    visit "/users"
    fill_in "first_name", with: new_user.first_name
    fill_in "last_name", with: new_user.last_name
    fill_in "email", with: new_user.email
    click_button "Create"
    expect(current_path).to eq("/users/new")
    expect(page).to have_content "Success!"
    expect(page).to have_content "Welcome, #{new_user.first_name}!"
  end
end
