require 'spec_helper'

feature "viewing list_items" do
  let!(:list) {Factory(:list)}
  let!(:list_item) {Factory(:list_item, :list => list)}

  before do
    visit '/'
    click_link list.name
  end

  scenario "viewing list items" do
    page.should have_content(list_item.name)
  end
end
