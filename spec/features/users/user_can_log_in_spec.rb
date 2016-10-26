require "rails_helper"

describe "User can log in" do
  scenario "a user can log in" do
    user = create(:user)

    visit '/login'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Login"

    expect(page).to have_content("You have successfully logged in")
  end
end
