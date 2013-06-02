require 'spec_helper'

feature 'create a list' do

  before do
    visit '/'
    click_link "New List"
  end

  scenario "creating a list" do
    fill_in "Name", :with => "A new list"
    click_button "Create List"
    page.should have_content("Created a new list.")
  end

  scenario "creating a list with invalid data" do
    fill_in "Name", :with => ""
    click_button "Create List"
    page.should have_content("Could not create list.")
    page.should have_content("Name can't be blank")
  end
end
