require 'date'
require 'ffaker'


FactoryGirl.define do

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
  #-- -------------------------------------------------------------------------
  #++


  factory :meeting_event do
    meeting_event_random

    # This should yield only valid MeetingEvent rows, for individual results (not relays):
    factory :meeting_event_individual do
      event_type do
        EventsByPoolType.only_for_meetings
          .not_relays
          .for_pool_type_code( meeting_session.swimming_pool.pool_type.code ){ rand - 0.5 }[0]
          .event_type
      end
    end

    # This should yield only valid MeetingEvent rows, for relay results (not individual):
    factory :meeting_event_relay do
      event_type do
        EventsByPoolType.only_for_meetings
          .are_relays
          .for_pool_type_code( meeting_session.swimming_pool.pool_type.code ){ rand - 0.5 }[0]
          .event_type
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end