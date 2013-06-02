require 'spec_helper'

feature "editing list" do
  let!(:list) {Factory(:list)}

  before do
    visit '/'
    click_link list.name
    click_link "Edit List"
  end

  scenario "edit a list" do
    fill_in "Name", :with => "some new and edited list"
    click_button "Update List"
    page.should have_content("List has been updated.")
  end

  scenario "should have an error with invalid data" do
    fill_in "Name", :with => ""
    click_button "Update List"
    page.should have_content("Could not update list.")
    page.should have_content("Name can't be blank")
  end
end

