require 'rails_helper'

describe "User can logout" do
  scenario "a user can logout" do
    user = create(:user)

    visit '/login'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"
    click_on "Logout"

    expect(page).to have_content("You have successfully logged out!")
  end
end
