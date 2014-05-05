require 'date'
require 'ffaker'


FactoryGirl.define do
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
    session_order             { ((rand * 100) % 4).to_i + 1}
    meeting
    scheduled_date            { Date.today } 
    day_part_type_id          { ((rand * 100) % 4).to_i + 1} # ASSERT: at least 4 timing types
    swimming_pool
    user
  end

  factory :meeting_event do
    event_order               { ((rand * 100) % 15).to_i + 1}
    meeting_session
    event_type_id             { ((rand * 100) % 18).to_i + 1} # ASSERT: at least 18 event types
    user
  end
end
