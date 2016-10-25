require 'rails_helper'

describe "User can create a boat class" do
  scenario "a user can create a new boat class" do
    class_name = "125cc Hydro"

    visit '/boat_classes/new'
    fill_in 'boat_class[class_name]', with: class_name
    click_on "Create Boat class"

    expect(page).to have_content "125cc Hydro was successfully created!"
  end
end
