require 'rails_helper'

describe Route do
  it 'has a valid factory' do
    expect(build :route).to be_valid
  end

  it 'has a distance bigger than 0' do
    expect(build :route, distance: 0).to be_invalid
  end

  it 'can\'t route to the same location' do
    location = build(:location)

    expect(build :route, origin: location, destination: location).to be_invalid
  end
end
