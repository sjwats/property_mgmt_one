require 'spec_helper'

feature 'owner is correlated with building' do
  scenario 'owner is attached to a building' do
    owner = FactoryGirl.create(:owner)
    visit '/'
    click_link 'Add New Building'
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    select owner.contact_info, from: 'Owner'
    save_and_open_page
    click_button 'Add Building'
    expect(page).to have_content('Building Added!')
  end

end
