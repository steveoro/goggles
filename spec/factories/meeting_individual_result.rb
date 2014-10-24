require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :common_meeting_individual_result_fields do
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
    disqualification_code_type { DisqualificationCodeType.all.sort{ rand - 0.5 }[0] }
    user
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :data_import_meeting_individual_result do
    data_import_session
    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..250] }
    common_meeting_individual_result_fields
    association :data_import_meeting_program, factory: :data_import_meeting_program_individual
    meeting_program_id        nil
    data_import_swimmer_id    nil
    data_import_team_id       nil
    data_import_badge_id      nil
    athlete_name              { swimmer.complete_name }
    team_name                 { team.name }
    athlete_badge_number      { badge.number }
    year_of_birth             { swimmer.year_of_birth }

    # Make the circular reference between the session and the
    # season valid:
    after(:create) do |created_instance, evaluator|
      created_instance.data_import_session.season = created_instance.data_import_meeting_program.meeting_session.season
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :meeting_individual_result do
    association :meeting_program, factory: :meeting_program_individual
    common_meeting_individual_result_fields

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
end
#-- ---------------------------------------------------------------------------
#++


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