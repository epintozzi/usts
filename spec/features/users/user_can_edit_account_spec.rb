require 'rails_helper'

describe "User can edit profile" do
  scenario "A user can visit their profile page and edit it" do
    user = User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@pintozzi.com", password: "helloworld", boat_number: "V26", usts_number: "12345")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    new_boat_number = "V36"
    new_last_name = "Barth"

    visit user_path(user)

    click_on "Edit Profile"
    fill_in 'user[boat_number]', with: new_boat_number
    fill_in 'user[last_name]', with: new_last_name
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_on "Update User"

    expect(page).to have_content new_boat_number
    expect(page).to have_content new_last_name
    expect(page).to have_content user.first_name
    expect(page).to have_content user.email
    expect(page).to have_content user.usts_number
  end
end
