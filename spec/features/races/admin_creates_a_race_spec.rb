require 'rails_helper'

describe "Admin can create a race" do
  context "as an admin" do
    scenario "an admin can enter data to create a new race" do
      admin = create(:admin)
      address = "202 W 1st St"
      city = "DePue"
      state = "IL"
      start_date = '2017/07/26'
      end_date = '2017/07/30'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/races/new'
      fill_in 'race[address]', with: address
      fill_in 'race[city]', with: city
      fill_in 'race[state]', with: state
      fill_in 'race[start_date]', with: start_date
      fill_in 'race[end_date]', with: end_date
      fill_in 'race[start_date]', with: start_date
      fill_in 'race[end_date]', with: end_date
      click_on "Create Race"

      expect(page).to have_content address
      expect(page).to have_content city
      expect(page).to have_content state
    end
  end

  context "as a default user" do
    scenario "they are shown a 404" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/admin/races/new'
      expect(page).to_not have_content("Create a new race")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
