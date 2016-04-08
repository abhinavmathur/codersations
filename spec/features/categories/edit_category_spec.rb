require 'rails_helper'

RSpec.feature 'Admin can edit a category' do
  let!(:category) { FactoryGirl.create(:category, name: 'Ruby')}

  before do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)
    visit admin_categories_path
    click_link 'Edit Category Name'
  end

  scenario 'unsuccessfully without a name' do
    fill_in 'Name', with: ' '
    fill_in 'Slug name', with: 'dksdksdjsk'
    click_button 'Update Category'

    expect(page).to have_content 'Category was not updated.'
  end

  scenario 'with a lowercase letter' do
    fill_in 'Name', with: 'ruby'
    fill_in 'Slug name', with: 'sdsjdhsjdhsjdh'
    click_button 'Update Category'

    expect(page).to have_content 'Category Ruby has been updated.'
  end

end