require 'spec_helper'

feature "delete list" do
  let!(:list) {Factory(:list)}

  before do
    visit '/'
    click_link list.name
  end

  scenario "delete a list" do
    click_link "Delete List"
    page.should have_content("List has been deleted.")

    visit '/'
    page.should_not have_content(list.name)
  end
end
