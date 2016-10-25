require 'rails_helper'

describe "User can create a race" do
  scenario "a user can enter data to create a new race" do
    address = "202 W 1st St"
    city = "DePue"
    state = "IL"
    start_date = '2017/07/26'
    end_date = '2017/07/30'

    visit '/races/new'
    fill_in 'race[address]', with: address
    fill_in 'race[city]', with: city
    fill_in 'race[state]', with: state
    fill_in 'race[start_date]', with: start_date
    fill_in 'race[end_date]', with: end_date
    # select start_date, from: 'start_date'
    # select end_date, from: 'end_date'
    click_on "Create Race"

    expect(page).to have_content address
    expect(page).to have_content city
    expect(page).to have_content state
  end
end
