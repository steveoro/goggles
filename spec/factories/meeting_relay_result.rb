require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :common_meeting_relay_result_fields do
    rank                      { ((rand * 100) % 25).to_i + 1 }
    is_play_off               true
    is_out_of_race            false
    is_disqualified           false
    standard_points           { (rand * 1000).to_i}
    meeting_points            { standard_points }
    entry_minutes             { ((rand * 4) % 4).to_i }
    seconds                   { ((rand * 60) % 60).to_i }
    hundreds                  { ((rand * 100) % 100).to_i }
    team
    relay_header              { Faker::Lorem.paragraph[0..50] }
    reaction_time             { rand.round(2) }
    entry_minutes             { ((rand * 4) % 4).to_i }
    entry_seconds             { ((rand * 60) % 60).to_i }
    entry_hundreds            { ((rand * 100) % 100).to_i }
    # No disqualify:
    disqualification_code_type nil # { DisqualificationCodeType.all.sort{ rand - 0.5 }[0] }
    user
  end


  factory :data_import_meeting_relay_result do
    data_import_session
    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..250] }
    common_meeting_individual_result_fields
    association :data_import_meeting_program, factory: :data_import_meeting_program_individual
    meeting_program_id        nil
    data_import_team_id       nil
    team_affiliation_id       nil # (If needed, this must be set externally to work: too much hierachy-tree dependency between needed entities)
  end


  factory :meeting_relay_result do
    association :meeting_program, factory: :meeting_program_individual
    common_meeting_individual_result_fields
    team_affiliation_id       nil # (If needed, this must be set externally to work: too much hierachy-tree dependency between needed entities)
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
