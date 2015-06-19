require 'rails_helper'

describe Map do
  it 'has a valid factory' do
    expect(build :map).to be_valid
  end

  it 'has an uniq name' do
    map = create(:map)
    expect(build(:map, name: map.name)).to be_invalid
  end

  it 'has a case insensitive name' do
    map = create :map, name: 'somename'
    expect(Map.find_by_name 'SOMenaMe').to eq(map)
  end
end