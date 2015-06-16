require 'rails_helper'

describe Route do
  it 'has a valid factory' do
    expect(build :route).to be_valid
  end

  it 'has a distance greater than or equal 1' do
    expect(build :route, distance: 0).to be_invalid
    expect(build :route, distance: 1).to be_valid
  end

  it 'always has a map' do
    expect(build :route, map: nil).to be_invalid
  end
end
