require 'spec_helper'

feature "create a list item" do
  let!(:list) {Factory(:list)}

  before do
    visit '/'
    click_link list.name
    click_link "New List Item"
  end

  scenario "create a new list item" do
    fill_in "Name", :with => "Something I have to do"
    fill_in "Description", :with => "Here is how I have to do it"
    click_button "Create List item"
    page.should have_content("Created a new list item.")
  end

  scenario "should not creat with invalid information" do
    fill_in "Name", :with => ""
    fill_in "Description", :with => ""
    click_button "Create List item"
    page.should have_content("Could not create a new list item.")
    page.should have_content("Name can't be blank")
    page.should have_content("Description can't be blank")
  end
end
