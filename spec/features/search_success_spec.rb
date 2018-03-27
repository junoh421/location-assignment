require "rails_helper"

feature "search spec" do
  let(:query) { "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA" }

  scenario "searches query and adds successful query to database" do
    expect{
      visit locations_path
      within ".location-search" do
        fill_in 'location[address]', with: query
        click_button "Search"
      end
    }.to change{Location.count}.from(0).to(1)
  end
end
