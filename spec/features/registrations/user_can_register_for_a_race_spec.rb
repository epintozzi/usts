require 'rails_helper'

describe "User can register for a race" do
  scenario "a user can register for a race" do
    user = create(:user)
    race = create(:race)
    boat_class = create(:boat_class)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_registration_path

    select race.city, from:"registration[race_id]"
    select boat_class.class_name, from:"registration[boat_class_id]"
    # fill_in "registration[boat_number]", with: user.boat_number
    click_on "Submit Registration"

    expect(page).to have_content "You have successfully registered for the #{race.city} race"
  end
end
