require 'rails_helper'

describe "User can view all users" do
  scenario "a user can view a list of all users" do
    user1, user2, user3 = create_list(:user, 3)

    visit users_path

    expect(page).to have_content user1.first_name
    expect(page).to have_content user2.first_name
    expect(page).to have_content user3.first_name
  end
end
