require 'rails_helper'

describe "User can view all races" do
  scenario "a user can view a list of all races" do
    race_1 = Race.create(address: "200 Lake St", city: "Depue", state: "IL", start_date: '2017/07/26', end_date: '2017/07/30')
    race_2 = Race.create(address: "100 Lake St", city: "Constantine", state: "MI", start_date: '2017/07/21', end_date: '2017/07/23')

    visit '/races'

    expect(page).to have_content(race_1.city)
    expect(page).to have_content(race_2.city)
    expect(page).to have_link(href: race_path(race_1))
    expect(page).to have_link(href: race_path(race_2))
  end
end
