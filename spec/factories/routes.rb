locations = %w(A B C D E F)

FactoryGirl.define do
  factory :route do
    origin { location.sample }
    destination { location.sample }
    distance { rand(1..100.0) }
    map { build(:map) }
  end
end
