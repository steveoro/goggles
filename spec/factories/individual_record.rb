require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :individual_record do
    meeting_individual_result

    pool_type_id        { meeting_individual_result.meeting_program.pool_type_id }
    event_type_id       { meeting_individual_result.meeting_program.meeting_event.event_type_id }
    category_type_id    { meeting_individual_result.meeting_program.category_type_id }
    gender_type_id      { meeting_individual_result.meeting_program.gender_type_id }

    minutes             { meeting_individual_result.minutes }
    seconds             { meeting_individual_result.seconds }
    hundreds            { meeting_individual_result.hundreds }
    is_team_record      { (rand * 100).to_i.even? }

    swimmer             { meeting_individual_result.swimmer }
    team                { meeting_individual_result.team }
    season_id           { meeting_individual_result.season.id }
    federation_type     { season.season_type.federation_type }
  end
end