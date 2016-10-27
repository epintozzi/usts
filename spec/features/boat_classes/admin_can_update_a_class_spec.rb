require 'rails_helper'

describe "Admin can update a boat class" do
  context "as an admin" do
    scenario "an admin can update an existing boat class" do
      boat_class = create(:boat_class)
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit "/admin/boat_classes/#{boat_class.id}/edit"
      fill_in 'boat_class[class_name]', with: "500ccR"
      click_on "Update Boat class"
      expect(page).to have_content "500ccR was successfully updated!"
    end
  end
  context "as a defult user" do
    scenario "they are shown a 404" do
      user = create(:user)
      boat_class = create(:boat_class)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/boat_classes/#{boat_class.id}/edit"
      expect(page).to_not have_content("Update #{boat_class.class_name}")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
