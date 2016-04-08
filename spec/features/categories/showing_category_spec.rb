require 'rails_helper'

RSpec.feature 'Show category' do
  let!(:category) { FactoryGirl.create(:category, name: 'Ruby')}

  scenario 'A category can be seen by everyone'do
    visit '/'
    click_link 'Categories'
    expect(page).to have_content 'Ruby'
  end

  scenario 'An admin can see the category in dashboard' do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)
    visit '/'
    click_link 'Admin Dashboard'
    within('div#category') do
      click_link 'Categories'
    end
    expect(page).to have_content 'Ruby'
  end
end