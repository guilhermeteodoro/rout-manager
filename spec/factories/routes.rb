map = FactoryGirl.build(:map)

FactoryGirl.define do
  factory :route do
    origin { build(:location, map: map) }
    destination { build(:location, map: map) }
    distance { rand(1..100.0) }
  end
end
