require 'ffaker'


FactoryGirl.define do

  factory :swimming_pool do
    name                    { "#{ Faker::Address.street_name } pool" }
    nick_name               { Faker::Address.street_name.downcase.gsub(' ', '') }
    address                 { Faker::Address.street_address }
    lanes_number            { 6 + 2 * ((rand * 10) % 3).to_i }
    has_multiple_pools      { (rand * 100).to_i.even? }
    has_open_area           { (rand * 100).to_i.even? }
    has_bar                 { (rand * 100).to_i.even? }
    has_restaurant_service  { (rand * 100).to_i.even? }
    has_gym_area            { (rand * 100).to_i.even? }
    has_children_area       { (rand * 100).to_i.even? }
    pool_type_id            { ((rand * 100) % 2).to_i + 1 }  # ASSERT: 25 and 50 meters type should exists
    city_id                 { ((rand * 100) % 40).to_i + 1 } # ASSERT: at least 40 cities
    user
  end
  # ---------------------------------------------------------------------------

end
