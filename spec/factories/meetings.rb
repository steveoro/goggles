require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :meeting do
    sequence( :code )         { |n| "meeting#(n)" }
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Meeting" }
    edition                   { ((rand * 100) % 40).to_i }
    season                    { Season.all.to_a[ rand * 10 ] } # Get all Season rows, choose a random one among the first 10
    header_year               { season.header_year }
    # The following 2 columns use the pre-loaded seed records:
    edition_type_id           { ((rand * 100) % 5).to_i + 1 } # ASSERT: at least 5 edition types (1..5)
    timing_type_id            { ((rand * 100) % 3).to_i + 1 } # ASSERT: at least 3 timing types (1..3)
    user

    factory :meeting_with_sessions do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_session,
          ((rand * 10) % 2).to_i + 1,
          meeting: created_instance            # association enforce for each sub-row
        )
      end
    end

    # Complete meeting, with sessions, events, programs, results and passages
    factory :meeting_complete do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_session_complete,
          ((rand * 10) % 2).to_i + 1,
          meeting:      created_instance            # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  factory :meeting_session do
    description               "FINALS"
    session_order             { ((rand * 100) % 4).to_i + 1}
    meeting
    # The following column uses the pre-loaded seed records:
    day_part_type_id          { ((rand * 100) % 4).to_i + 1} # ASSERT: at least 4 timing types
    scheduled_date            { Date.today }
    warm_up_time              { Time.now }
    begin_time                { Time.now }
    swimming_pool
    user

    factory :meeting_session_with_rows do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_event,
          ((rand * 10) % 3).to_i + 2,
          meeting_session: created_instance         # association enforce for each sub-row
        )
      end
    end

    factory :meeting_session_complete do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_event_complete,
          ((rand * 10) % 3).to_i + 2,
          meeting_session: created_instance         # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  factory :meeting_event do
    event_order               { ((rand * 100) % 15).to_i + 1 }
    meeting_session
    # The following 2 columns use the pre-loaded seed records:
    #event_type_id             { ((rand * 100) % 18).to_i + 1 } # ASSERT: at least 18 event types
    event_type_id             { EventsByPoolType.only_for_meetings.not_relays.for_pool_type_code( meeting_session.swimming_pool.pool_type.code ).to_a[ rand * 16 ].event_type_id }
    heat_type_id              { ((rand * 100) % 3).to_i + 1 }  # ASSERT: at least 3 heat types
    user

    factory :meeting_event_with_programs do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_program,
          ((rand * 10) % 3).to_i + 2,
          meeting_event: created_instance           # association enforce for each sub-row
        )
      end
    end

    factory :meeting_event_complete do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_program_complete,
          ((rand * 10) % 3).to_i + 2,
          meeting_event: created_instance           # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  factory :meeting_program do
    event_order               { ((rand * 100) % 25).to_i + 1 }
    meeting_event
    # The following 2 columns use the pre-loaded seed records:
    category_type_id          { ((rand * 100) % 20).to_i + 1 } # ASSERT: at least 20 category types
    gender_type_id            { ((rand * 100) % 2).to_i + 1 }  # ASSERT: at least 2 gender types
    pool_type_id              { meeting_event.meeting_session.swimming_pool.pool_type_id }
    user

    factory :meeting_program_with_results do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_individual_result,
          ((rand * 10) % 5).to_i + 4,
          meeting_program: created_instance         # association enforce for each sub-row
        )
      end
    end

    factory :meeting_program_complete do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_individual_result_with_passages,
          ((rand * 10) % 5).to_i + 2,
          meeting_program: created_instance         # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

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

    factory :meeting_individual_result_with_passages do
      after(:create) do |created_instance, evaluator|
        create_list(
          :passage,
          ((rand * 10) % 3).to_i + 1,
          meeting_individual_result: created_instance # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  factory :passage do
    meeting_individual_result
    meeting_program           { meeting_individual_result.meeting_program }
    minutes                   0
    seconds                   { ((rand * 59) % 59).to_i }  # Forced not to use 59
    hundreds                  { ((rand * 99) % 99).to_i }  # Forced not to use 99
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
  #-- -------------------------------------------------------------------------
  #++
end


# Quick NameSpace container for creation-tools regarding this factory.
#
module MeetingIndividualResultFactoryTools

  # Creates (and returns) an Array of MeetingIndividualResult rows associated
  # to the specified swimmer, each with an unique event_type_id.
  def self.create_unique_result_list( swimmer, row_count = 5 )
    list = []
    event_list = EventsByPoolType.only_for_meetings.not_relays.select([:event_type_id, :pool_type_id]).sort{ rand() - 0.5 }[ 0.. row_count-1 ]
    event_list.each do |event_by_pool_type|
      list << FactoryGirl.create( :meeting_individual_result,
        swimmer_id:      swimmer.id,
        meeting_program: FactoryGirl.create( :meeting_program,
          meeting_event: FactoryGirl.create( :meeting_event,
            meeting_session: FactoryGirl.create( :meeting_session,
              swimming_pool: FactoryGirl.create( :swimming_pool,
                pool_type_id: event_by_pool_type.pool_type_id
              )
            ),
            event_type_id: event_by_pool_type.event_type_id
          ),
          gender_type_id: swimmer.gender_type_id
        )
      )
    end
    list
  end
end
#-- ---------------------------------------------------------------------------
#++
