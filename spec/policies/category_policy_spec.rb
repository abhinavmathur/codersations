require 'rails_helper'

RSpec.feature 'Only permitted users can create category' do

  scenario 'when it an anonymous user' do
    visit new_admin_category_path
    expect(page).to_not have_content 'Admin Dashboard'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'when it is a normal user' do
    user = FactoryGirl.create(:user, name: 'asasas')
    login_as(user)
    visit new_admin_category_path
    expect(page).to_not have_content 'Admin Dashboard'
    expect(page).to have_content 'You must be an admin to do that :)'
  end

  scenario 'when it a manager' do
    user = FactoryGirl.create(:user, :manager)
    login_as(user)
    visit new_admin_category_path
    expect(page).to_not have_content 'Admin Dashboard'
    expect(page).to have_content 'You must be an admin to do that :)'
  end

  scenario 'when it is a creator' do
    user = FactoryGirl.create(:user, :creator)
    login_as(user)
    visit new_admin_category_path
    expect(page).to_not have_content 'Admin Dashboard'
    expect(page).to have_content 'You must be an admin to do that :)'
  end

  scenario 'when it is an admin' do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)
    visit new_admin_category_path
    expect(page).to have_content 'Admin Dashboard'
    expect(page).to_not have_content 'You must be an admin to do that :)'
  end
end