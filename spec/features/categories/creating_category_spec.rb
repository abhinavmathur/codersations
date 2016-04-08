require 'rails_helper'

RSpec.feature 'Admin can create categories' do

  before do
    admin = FactoryGirl.create(:user, :admin, name: 'Abhinav')
    login_as(admin)
    visit '/'
  end
  scenario 'unsuccessfully' do
    click_link 'Admin Dashboard'
    within('div#category') do
      click_link 'Categories', match: :first
    end
    click_link 'Create a category'
    fill_in 'Name', with: ''
    fill_in 'Slug name', with: ''
    click_button 'Create Category'

    expect(page).to have_content 'Category was not created.'
  end

  scenario 'successfully' do
    click_link 'Admin Dashboard'
    within('div#category') do
      click_link 'Categories', match: :first
    end
    click_link 'Create a category'
    fill_in 'Name', with: 'ruby'
    fill_in 'Slug name', with: 'ruby'
    click_button 'Create Category'

    expect(page).to have_content 'Category Ruby has been created.'
  end
end