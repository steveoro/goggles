require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :meeting do
    sequence( :code )         { |n| "meeting#(n)" }
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Meeting" }
    edition                   { ((rand * 100) % 40).to_i }
    season                    { Season.all.to_a[ rand * 10 ] } # Get all Season rows, choose a random one among the first 10
    header_date               { season.begin_date + (rand * 100).to_i.days }
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
  end
  #-- -------------------------------------------------------------------------
  #++


  trait :meeting_event_random do
    event_order               { ((rand * 100) % 15).to_i + 1 }
    meeting_session
    event_type_id do                                # This will include also relays
      EventsByPoolType.only_for_meetings
        .for_pool_type_code(
          meeting_session.swimming_pool.pool_type.code
      ){ rand - 0.5 }[0].event_type_id
    end
    heat_type                 { HeatType.all.sort{ rand - 0.5 }[0] }
    user
  end


  factory :meeting_event do
    meeting_event_random
  end
  #-- -------------------------------------------------------------------------
  #++


  trait :common_meeting_program_fields do
    event_order               { ((rand * 100) % 25).to_i + 1 }
    gender_type_id            { ((rand * 10) % 2).to_i + 1 }  # ASSERT: at least 2 gender types
    user
  end


  factory :data_import_meeting_program do
    data_import_session
    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..250] }
    common_meeting_program_fields
    data_import_meeting_session_id nil
    meeting_session
    event_type do
      EventsByPoolType.only_for_meetings
        .for_pool_type_code( meeting_session.swimming_pool.pool_type.code ){ rand - 0.5 }[0]
        .event_type
    end
    category_type do                                # Get a coherent category according to the meeting_event:
      event_type.is_a_relay ?
      CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] :
      CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
    end
    minutes                   { ((rand * 2) % 2).to_i }
    seconds                   { ((rand * 60) % 60).to_i }
    hundreds                  { ((rand * 100) % 100).to_i }
    is_out_of_race            false
    heat_type_id              HeatType::FINALS_ID

    # Make the circular reference between the session and the
    # season valid:
    after(:create) do |created_instance, evaluator|
      created_instance.data_import_session.season = created_instance.meeting_session.season
    end

    factory :data_import_meeting_program_individual do
      event_type do
        EventsByPoolType.only_for_meetings
          .not_relays
          .for_pool_type_code( meeting_session.swimming_pool.pool_type.code ){ rand - 0.5 }[0]
          .event_type
      end
      category_type do                              # Get a coherent category according to the meeting_event:
        CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
      end
    end

    factory :data_import_meeting_program_relay do
      event_type do
        EventsByPoolType.only_for_meetings
          .are_relays
          .for_pool_type_code( meeting_session.swimming_pool.pool_type.code ){ rand - 0.5 }[0]
          .event_type
      end
      category_type do                              # Get a coherent category according to the meeting_event:
        CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0]
      end
    end
  end


  factory :meeting_program do
    common_meeting_program_fields
    meeting_event
    category_type do                                # Get a coherent category according to the meeting_event:
      meeting_event.event_type.is_a_relay ?
      CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] :
      CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
    end
    pool_type                 { meeting_event.meeting_session.swimming_pool.pool_type }

    # This should yield only valid MeetingProgram rows, for individual results (not relays):
    factory :meeting_program_individual do
      pool_type               { PoolType.only_for_meetings{ rand - 0.5 }[0] }
      meeting_event do
        create(
          :meeting_event,
          meeting_session: create(:meeting_session),
          event_type: EventsByPoolType.only_for_meetings
            .not_relays
            .for_pool_type_code( pool_type.code ){ rand - 0.5 }[0]
            .event_type
        )
      end
      category_type           { CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0] }
    end

    # This should yield only valid MeetingProgram rows, for relay results (not individual):
    factory :meeting_program_relay do
      pool_type               { PoolType.only_for_meetings{ rand - 0.5 }[0] }
      meeting_event do
        create(
          :meeting_event,
          meeting_session: create(:meeting_session),
          event_type: EventsByPoolType.only_for_meetings
            .are_relays
            .for_pool_type_code( pool_type.code ){ rand - 0.5 }[0]
            .event_type
        )
      end
      category_type           { CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
