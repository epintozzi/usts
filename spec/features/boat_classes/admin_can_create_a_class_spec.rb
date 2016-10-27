require 'rails_helper'

describe "Admin can create a boat class" do
  context "as an admin" do
    scenario "an admin can create a new boat class" do
      class_name = "125cc Hydro"
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/boat_classes/new'
      fill_in 'boat_class[class_name]', with: class_name
      click_on "Create Boat class"

      expect(page).to have_content "125cc Hydro was successfully created!"
    end
  end
  context "as a defult user" do
    scenario "they are shown a 404" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/admin/boat_classes/new'
      expect(page).to_not have_content("Create a new class")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
