require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :meeting_session do
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
end
