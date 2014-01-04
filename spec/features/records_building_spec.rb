require 'spec_helper'

feature 'User records a new building' do
  scenario 'user records new building with valid attributes' do
    visit '/'
    click_link 'Add New Building'
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    click_button 'Add Building'
    expect(page).to have_content('Building Added!')

  end

  scenario 'user records new building with invalid attributes' do
      visit new_building_path

      click_on "Add Building"

      expect(page).to_not have_content('Building Added!')
      expect(page).to have_selector('p.add_building')

      within ".input.building_street_address" do
        expect(page).to have_content "can't be blank"
      end

      within ".input.building_city" do
        expect(page).to have_content "can't be blank"
      end

      within ".input.building_state" do
        expect(page).to have_content "can't be blank"
      end

      within ".input.building_postal_code" do
        expect(page).to have_content "can't be blank"
      end
  end

end
