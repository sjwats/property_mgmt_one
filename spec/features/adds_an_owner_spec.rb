require 'spec_helper'

feature 'record an owner' do
  scenario 'with valid attribute input' do
    visit '/'
    click_on 'View Owners'
    click_link 'Add New Owner'
    fill_in 'First name', with: 'Michael'
    fill_in 'Last name', with: 'Bluth'
    fill_in 'Email', with: 'michael@bluth.com'
    fill_in 'Company name', with: 'Bluth Company'
    click_button 'Add Owner'
    expect(page).to have_content('Owner Added!')
    expect(page).to have_selector('p.add_owner')

  end

  scenario 'with invalid input' do
    visit '/'
    click_on 'View Owners'
    click_link 'Add New Owner'
    click_button 'Add Owner'

    expect(page).to_not have_content('Owner Added!')
    expect(page).to have_selector('p.add_owner')

    within ".input.owner_first_name" do
      expect(page).to have_content "can't be blank"
    end

    within ".input.owner_last_name" do
      expect(page).to have_content "can't be blank"
    end

    within ".input.owner_email" do
      expect(page).to have_content "can't be blank"
    end
  end

  scenario 'with duplicate email' do
    owner = FactoryGirl.create(:owner)
    visit new_owner_path
    fill_in 'First name', with: 'Michael'
    fill_in 'Last name', with: 'Bluth'
    fill_in 'Email', with: owner.email
    click_button 'Add Owner'
    expect(page).to_not have_content('Owner Added!')
    within ".input.owner_email" do
      expect(page).to have_content "has already been taken"
    end
  end

end
