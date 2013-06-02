require 'spec_helper'

feature "deleting list item" do
  let!(:list) {Factory(:list)}
  let!(:list_item) {Factory(:list_item, :list => list)}

  before do
    visit '/'
    click_link list.name
    click_link list_item.name
  end

  scenario "deleting a list item" do
    click_link "Delete List Item"
    page.should have_content("List item has been deleted.")

    visit '/'
    click_link list.name
    page.should_not have_content(list_item.name)
  end
end
