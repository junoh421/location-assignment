require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_valid(:address).when('123 State Street', 'Boston', '02113') }
  it { should have_valid(:longitude).when(37.4224082) }
  it { should have_valid(:latitude).when(-122.0856086) }
end
