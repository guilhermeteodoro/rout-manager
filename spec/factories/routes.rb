locations = %w(A B C D E F)

FactoryGirl.define do
  factory :route do
    association :map, strategy: :build

    origin { locations.sample }
    destination { locations.sample }
    distance { rand(1..100) }
  end
end
