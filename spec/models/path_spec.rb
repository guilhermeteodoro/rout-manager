require 'rails_helper'

describe Path do
  it 'has a valid factory' do
    expect(build :path).to be_valid
  end

  it 'has a distance greater than or equal to 1' do
    expect(build :path, distance: 0).to be_invalid
    expect(build :path, distance: 1).to be_valid
  end

  it 'always has a map' do
    expect(build :path, map: nil).to be_invalid
  end

  it 'has an origin different from destination'
end