FactoryGirl.define do
  factory :route do
    map { create(:map, paths: build_list(:path, 20)) }
    map_name { map.name }
    origin { map.paths.sample.origin }
    destination { map.paths.sample.destination }
    autonomy { rand(0..20.0) }
    liter_price { rand(0..5.0) }
  end
end
