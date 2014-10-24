require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :common_meeting_program_fields do
    event_order               { ((rand * 100) % 25).to_i + 1 }
    gender_type_id            { ((rand * 10) % 2).to_i + 1 }  # ASSERT: at least 2 gender types
    user
  end
  #-- -------------------------------------------------------------------------
  #++


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
  #-- -------------------------------------------------------------------------
  #++


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
      meeting_event           { create( :meeting_event_individual ) }
      category_type           { CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0] }
    end

    # This should yield only valid MeetingProgram rows, for relay results (not individual):
    factory :meeting_program_relay do
      pool_type               { PoolType.only_for_meetings{ rand - 0.5 }[0] }
      meeting_event           { create( :meeting_event_relay ) }
      category_type           { CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end