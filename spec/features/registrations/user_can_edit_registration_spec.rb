require 'rails_helper'

describe "User can edit a registration" do
  scenario "a user can update an existing registration" do
    user = create(:user)
    race = create(:race)
    boat_class = create(:boat_class)
    boat_class_2 = BoatClass.create(class_name: "C Service Hydro")
    registration = Registration.create(user_id: user.id, race_id: race.id, boat_class_id: boat_class.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_registration_path(registration)

    select boat_class_2.class_name, from:"registration[boat_class_id]"

    click_on "Submit Registration"

    expect(page).to have_content "You have successfully updated your registration for the #{registration.race.city} race"
  end
end
