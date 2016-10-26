require 'rails_helper'

describe "User can create account" do
  scenario "a user can create a new account" do
    first_name = "Erin"
    last_name = "Pintozzi"
    email = "erin@pintozzi.com"
    password = "helloworld"
    boat_number = "V26"
    usts_number = "12345"

    visit '/users/new'
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    fill_in 'user[boat_number]', with: boat_number
    fill_in 'user[usts_number]', with: usts_number
    click_on "Create User"

    expect(page).to have_content first_name
    expect(page).to have_content last_name
    expect(page).to have_content email
    expect(page).to have_content boat_number
    expect(page).to have_content usts_number
  end
end
