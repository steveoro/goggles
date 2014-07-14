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
    day_part_type_id          { ((rand * 100) % 4).to_i + 1} # ASSERT: at least 4 timing types
    scheduled_date            { Date.today } 
    warm_up_time              { Time.now } 
    begin_time                { Time.now } 
    swimming_pool
    user

    factory :meeting_session_with_rows do
      # the after(:create) yields two values: the row instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the association is set properly to the created instance:
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_event,
          ((rand * 10).to_i + 2),                   # total number or detail rows
          meeting_session: created_instance         # association enforce for each sub-row
        )
      end
    end
  end

  factory :meeting_event do
    event_order               { ((rand * 100) % 15).to_i + 1}
    meeting_session
    event_type_id             { ((rand * 100) % 18).to_i + 1} # ASSERT: at least 18 event types
    heat_type_id              { ((rand * 100) % 3).to_i + 1} # ASSERT: at least 3 heat types
    user
  end

  factory :meeting_program do
    event_order               { ((rand * 100) % 25).to_i + 1 }
    meeting_event
    category_type_id          { ((rand * 100) % 20).to_i + 1 } # ASSERT: at least 20 category types
    gender_type_id            { ((rand * 100) % 2).to_i + 1 }  # ASSERT: at least 2 gender types
    pool_type_id              { meeting_event.meeting_session.swimming_pool.pool_type_id }
    user
  end

  factory :meeting_individual_result do
    meeting_program
    rank                      { ((rand * 100) % 25).to_i + 1 }
    standard_points           { (rand * 1000).to_i}
    meeting_individual_points { standard_points }
    team_points               { ((rand * 10) % 10).to_i + 1 }
    goggle_cup_points         { (rand * 1000).to_i }
    reaction_time             { rand.round(2) }
    badge
    team                      { badge.team }
    team_affiliation          { badge.team_affiliation }
    swimmer                   { badge.swimmer }
    minutes                   0
    seconds                   { ((rand * 60) % 60).to_i }
    hundreds                  { ((rand * 100) % 100).to_i }
    # The following column uses the pre-loaded seed records:
    disqualification_code_type_id { ((rand * 100) % 60).to_i + 1 }
    user
  end

  factory :passage do
    meeting_individual_result
    meeting_program           { meeting_individual_result.meeting_program }
    minutes                   0
    seconds                   { ((rand * 60) % 60).to_i }
    hundreds                  { ((rand * 100) % 100).to_i }
    minutes_from_start        1
    seconds_from_start        { seconds }
    hundreds_from_start       { hundreds }
    position                  { ((rand * 10) % 10).to_i + 1 }
    reaction_time             { rand.round(2) }
    stroke_cycles             { (rand * 20).to_i }
    swimmer                   { meeting_individual_result.swimmer }
    team                      { meeting_individual_result.team }
    user
    # The following column uses the pre-loaded seed records:
    passage_type_id           { ((rand * 20) % 20).to_i + 1 }
  end
end
