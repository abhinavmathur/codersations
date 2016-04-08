require 'rails_helper'

RSpec.feature 'Deleting a category' do
  let!(:category) { FactoryGirl.create(:category, name: 'Python') }

  before do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)
    visit admin_categories_path
  end

  scenario 'successfully', js:true do
    page.accept_confirm do
      click_link 'Delete'
    end

    expect(page).not_to have_content 'Python'
    expect(page).to have_content 'Category was successfully deleted.'
  end
end