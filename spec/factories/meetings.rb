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
    heat_type_id              { ((rand * 100) % 3).to_i + 1} # ASSERT: at least 3 heat types
    user
  end

  factory :meeting_program do
    event_order               { ((rand * 100) % 25).to_i + 1}
    meeting_event
    category_type_id          { ((rand * 100) % 20).to_i + 1} # ASSERT: at least 20 category types
    gender_type_id            { ((rand * 100) % 2).to_i + 1} # ASSERT: at least 2 gender types
    user
  end

  factory :meeting_individual_result do
    meeting_program
    rank                      { ((rand * 100) % 25).to_i + 1}
    standard_points           { (rand * 1000).to_i}
    meeting_points            { standard_points }
    team_points               { ((rand * 10) % 10).to_i + 1}
    google_cup_points         { (rand * 1000).to_i}
    reaction_time             { rand.round(2) }
    team
    badge
    user
  end
end
