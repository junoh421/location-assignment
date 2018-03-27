require "rails_helper"

feature "search spec" do
  let(:blank_query) { "" }
  let(:nonmatching_query) { "fdjakgbknlqtnklgwqlkeg"}

  scenario "invalid query does not add to database" do
    expect{
      visit locations_path
      within ".location-search" do
        fill_in 'location[address]', with: blank_query
        click_button "Search"
      end
      expect(page).to have_content("Please enter a query to geocode, or click on the map to reverse geocode.")
    }.to change{Location.count}.by(0)
  end

  scenario "invalid query does not add to database" do
    expect{
      visit locations_path
      within ".location-search" do
        fill_in 'location[address]', with: nonmatching_query
        click_button "Search"
      end
      expect(page).to have_content("The request did not encounter any errors, but return no results.")
    }.to change{Location.count}.by(0)
  end
end
