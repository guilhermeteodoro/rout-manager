require 'rails_helper'

describe Path do
  it 'has a valid factory' do
    expect(build :path).to be_valid
  end

  it 'has a distance greater than or equal to 1' do
    expect(build :path, distance: 0).to be_invalid
    expect(build :path, distance: 1).to be_valid
  end

  it 'has always an upcase origin and destination' do
    origin = 'oriGin'
    destination = 'destination'

    path = create(:path, origin: origin, destination: destination)

    expect(path.origin).to eq(origin.upcase)
    expect(path.destination).to eq(destination.upcase)
  end

  it 'always has a map' do
    expect(build :path, map: nil).to be_invalid
  end

  context 'within the same map' do
    it 'can have equal paths with different destinations' do
      path = create :path

      expect(build :path, origin: path.origin, destination: path.destination, map: path.map).to be_valid
      expect(build :path, origin: path.origin, destination: path.destination, distance: path.distance).to be_valid
      expect(build :path, origin: path.origin, destination: path.destination, distance: path.distance, map: path.map).to be_invalid
    end
  end
end