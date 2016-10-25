require 'rails_helper'

describe "User can view single race details" do
  scenario "a user can visit an individual race's page to see details" do
    race = Race.create(address: "200 Lake St", city: "Depue", state: "IL", start_date: '2017/07/26', end_date: '2017/07/30')

    visit race_path(race)

    expect(page).to have_content(race.address)
    expect(page).to have_content(race.city)
    expect(page).to have_content(race.state)
    # expect(page).to have_content(race.start_date)
    # expect(page).to have_content(race.end_date)
  end
end
