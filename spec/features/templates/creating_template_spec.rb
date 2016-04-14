require 'rails_helper'

RSpec.feature 'a template can be created' do
  context 'basic template creation' do

    before do
      creator = FactoryGirl.create(:user, :creator, name: 'Abhinav Mathur')
      login_as(creator)
    end

    scenario 'by a content creator from category page successfully' do
      category = FactoryGirl.create(:category, name: 'Ruby')
      visit category_path(category)
      click_link 'Create a Template'
      fill_in 'Name', with: 'A sample template'
      fill_in 'Description', with: 'dkadjksdjksjdksdjksdjdsksdks'
      fill_in 'Points covered', with: 'skdksdjskdjskdjksdjksjd'
      click_button 'Create Template'

      expect(page).to have_content 'Template has been created successfully'
      expect(page).to have_content 'A sample template'
    end

    scenario 'unsuccessfully without required fields' do
      category = FactoryGirl.create(:category, name: 'Ruby')
      visit category_path(category)
      click_link 'Create a Template'
      fill_in 'Name', with: ' '
      fill_in 'Description', with: ' '
      fill_in 'Points covered', with: ' '
      click_button 'Create Template'

      expect(page).to have_content 'Template was not created'
      expect(page).to have_content "can't be blank"
    end

    scenario 'create a template from user page' do
      click_link 'Abhinav'
      click_link 'Create a Template'
      fill_in 'Name', with: 'A sample template'
      fill_in 'Description', with: 'dkadjksdjksjdksdjksdjdsksdks'
      fill_in 'Points covered', with: 'skdksdjskdjskdjksdjksjd'
      click_button 'Create Template'

      expect(page).to have_content 'Template has been created successfully'
      expect(page).to have_content 'A sample template'
    end
  end


end

