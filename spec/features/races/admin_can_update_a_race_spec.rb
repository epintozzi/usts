require 'rails_helper'

describe "Admin can update a race" do
  context "as an admin" do
    scenario "an admin can enter data to update an existing race" do
      admin = create(:admin)
      race = create(:race)

      address = "200 W 1st St"
      city = "DePue"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit "/admin/races/#{race.id}/edit"
      fill_in 'race[address]', with: address
      fill_in 'race[city]', with: city
      click_on "Update Race"

      expect(page).to have_content address
      expect(page).to have_content city
      expect(page).to_not have_content "Yemen"
    end
  end

  context "as a default user" do
    scenario "they are shown a 404" do
      user = create(:user)
      race = create(:race)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/races/#{race.id}/edit"
      expect(page).to_not have_content("Edit #{race.city} race")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
