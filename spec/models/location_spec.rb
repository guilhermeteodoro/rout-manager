require 'rails_helper'

describe Location do
  it 'has a valid factory' do
    expect(build :location).to be_valid
  end

  it 'has an uniq name under the same map' do
    map = build(:map)
    location = create(:location, name: 'Name', map: map)

    expect(build(:location, name: location.name, map: map)).to be_invalid
    expect(build(:location, name: 'Another Name', map: map)).to be_valid
  end
end
