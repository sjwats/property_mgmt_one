require 'spec_helper'

feature 'User records a new building' do
  scenario 'user records new building with valid attributes' do
    visit '/'
    click_link 'Add New Building'
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select state, from: "State"
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    click_button 'Add Building'
    expect(page).to have_content('Building Added!')
    expect(page).to have_content('41 Wharf st')
    expect(page).to have_content('Boston')
    expect(page).to have_content('02135')
    expect(page).to have_content('Optional description')
  end

end
