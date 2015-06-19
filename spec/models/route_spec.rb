require 'rails_helper'

describe Route do
  it 'has a valid factory' do
    expect(build :path).to be_valid
  end

  let(:route) { build(:route) }

  describe 'validations' do
    it { expect(route).to validate_presence_of(:origin) }
    it { expect(route).to validate_presence_of(:destination) }
    it { expect(route).to validate_presence_of(:autonomy) }
    it { expect(route).to validate_presence_of(:liter_price) }
    it { expect(route).to validate_numericality_of(:autonomy).is_greater_than(0) }
    it { expect(route).to validate_numericality_of(:liter_price).is_greater_than(0) }
  end

  it 'returns a hash from solve' do
    expect(route.solve.class).to eq(Hash)
  end
end
