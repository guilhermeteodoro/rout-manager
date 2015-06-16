FactoryGirl.define do
  factory :map do
    name { Faker::Address.state_abbr }
  end
end
