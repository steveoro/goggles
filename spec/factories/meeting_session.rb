require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :common_meeting_session_fields do
    description               "FINALS"
    session_order             { ((rand * 100) % 4).to_i + 1}
    meeting
    # The following column uses the pre-loaded seed records:
    day_part_type_id          { ((rand * 100) % 4).to_i + 1} # ASSERT: at least 4 timing types
    scheduled_date            { Date.today }
    warm_up_time              { Time.now }
    begin_time                { Time.now }
    swimming_pool # this will yield pools with type "only_for_meetings"
    user
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :data_import_meeting_session do
    data_import_session
    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..250] }
    data_import_meeting_id    nil
    common_meeting_session_fields
  end


  factory :meeting_session do
    common_meeting_session_fields
  end
  #-- -------------------------------------------------------------------------
  #++
end
