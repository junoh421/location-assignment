require "rails_helper"

RSpec.describe LocationsController, type: :controller do
  let!(:query_one) { Location.create(address: "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA", longitude: 37.4224082, latitude: -122.0856086) }
  let!(:query_two) { Location.create(address: "1 Infinite Loop; Cupertino, CA 95014", longitude: 37.3331689802915, latitude:  -122.0298310197085) }

  describe "GET#index" do
    it "should return a list of all the locations" do
      get :index
      expect(response.status).to eq 200
      expect(assigns[:locations]).to include(query_one, query_two)
    end
  end
end
