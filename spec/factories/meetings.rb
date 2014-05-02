require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :swimmin_pool do
    nickname                  "FAKEBATH"
    name                      { "#{Faker::Address.city} municipal swimming pool" }
    lanes_number              6                            # Not important at this moment
    pool_type_id              { ((rand * 100) % 2).to_i + 1 }  # ASSERT: 25 and 50 meters type should exists
    city_id                   { ((rand * 100) % 50).to_i + 1 } # ASSERT: at least 50 cities
  end

  factory :meeting do
    sequence( :code )         { |n| "farloque#(n)" }
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Meeting" }
    edition                   { ((rand * 100) % 40).to_i }
    season
    header_year               { season.header_year }
    edition_type_id           { ((rand * 100) % 5).to_i + 1 } # ASSERT: at least 5 edition types (1..5)
    timing_type_id            { ((rand * 100) % 3).to_i + 1 } # ASSERT: at least 3 timing types (1..3)
    user
  end

  factory :meeting_session do
    description               "FINALS"
    session_order             { ((rand * 100) % 4).to_i }
    meeting
    scheduled_date            { Date.today } 
    day_part_type             { ((rand * 100) % 4).to_i } # ASSERT: at least 4 timing types
    swimming_pool
    user
  end
end
