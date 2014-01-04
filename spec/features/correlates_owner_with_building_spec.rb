require 'spec_helper'

feature 'owner is correlated with building' do
  scenario 'owner is added to a building' do
    owner = FactoryGirl.create(:owner)
    visit '/'
    click_link 'Add New Building'
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    select owner.contact_info, from: 'Owner'
    click_button 'Add Building'
    expect(page).to have_content('Building Added!')
  end

   scenario 'owner is verifiably correlated with a building' do
    owner = FactoryGirl.create(:owner)
    visit '/'
    click_link 'Add New Building'
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    select owner.contact_info, from: 'Owner'
    click_button 'Add Building'
    visit buildings_path
    expect(page).to have_content(owner.id)
  end

  scenario 'owner is deleted from multiple buildings' do
    owner = FactoryGirl.create(:owner)
    visit new_building_path
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    select owner.contact_info, from: 'Owner'
    click_button 'Add Building'
    fill_in 'Street address', with: '50 Harvard Ave'
    fill_in 'City', with: 'Brookline'
    select 'MA', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Another pptional description'
    select owner.contact_info, from: 'Owner'
    click_button 'Add Building'
    visit owners_path
    click_link 'Delete Owner'
    expect(page).to_not have_content(owner.first_name)
    expect(page).to_not have_content(owner.last_name)
    expect(page).to_not have_content(owner.email)
    expect(page).to_not have_content(owner.company_name)
    expect(page).to_not have_content('41 Wharf st')
    expect(page).to_not have_content('50 Harvard Ave')
    expect(page).to have_content('Owner successfully deleted!')
  end

  scenario 'building no longer correlated to deleted owner' do
    owner = FactoryGirl.create(:owner)
    visit new_building_path
    fill_in 'Street address', with: '41 Wharf st'
    fill_in 'City', with: 'Boston'
    select 'ME', from: 'State'
    fill_in 'Postal code', with: '02135'
    fill_in 'Description', with: 'Optional description'
    select owner.contact_info, from: 'Owner'
    click_button 'Add Building'
    visit owners_path
    click_link 'Delete Owner'
    visit buildings_path
    expect(page).to have_content('41 Wharf st')
    expect(page).to_not have_content(owner.id)
  end

end
