FactoryGirl.define do
  factory :location do
    name { Faker::Address.city }
    map { build(:map) }
  end
end
