require 'spec_helper'

feature "editing list_items" do
  let!(:list) {Factory(:list)}
  let!(:list_item) {Factory(:list_item, :list => list)}

  before do
    visit '/'
    click_link list.name
    click_link list_item.name
    click_link "Edit List Item"
  end

  scenario "updating a list item" do
    fill_in "Name", :with => "Some other thing I have to do."
    click_button "Update List item"
    page.should have_content("Updated list item.")
    page.should have_content("Some other thing I have to do.")
    page.should_not have_content(list_item.name)
  end

  scenario "updating with invalid info" do
    fill_in "Name", :with => ""
    fill_in "Description", :with => ""
    click_button "Update List item"
    page.should have_content("Could not update list item")
    page.should have_content("Name can't be blank")
    page.should have_content("Description can't be blank")

  end
end