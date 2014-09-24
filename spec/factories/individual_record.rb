require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :individual_record do
    meeting_individual_result

    pool_type_id        { meeting_individual_result.meeting_program.pool_type_id }
    event_type_id       { meeting_individual_result.meeting_program.meeting_event.event_type_id }
    category_type_id    { meeting_individual_result.meeting_program.category_type_id }
    gender_type_id      { meeting_individual_result.meeting_program.gender_type_id }
    record_type_id      7  # Assumes always federation record (from seeds)

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
#-- ---------------------------------------------------------------------------
#++


# Quick NameSpace container for creation-tools regarding this factory.
#
module IndividualRecordFactoryTools

  # Leega version, forced to use events_by_pool_type
  # Creates (and returns) an Array of IndividualRecord rows associated
  # to the specified swimmer, each with an unique event_type_id and
  # with record_type_id forced to 1 (= "personal best").
  def self.create_personal_best_list( swimmer, row_count = 5 )
    list = []
    event_list = EventsByPoolType.only_for_meetings.not_relays.select([:event_type_id, :pool_type_id]).sort{ rand() - 0.5 }[ 0.. row_count-1 ]
    event_list.each do |event_by_pool_type|
      list << FactoryGirl.create( :individual_record,
        swimmer_id: swimmer.id,
        meeting_individual_result: FactoryGirl.create( :meeting_individual_result,
          swimmer_id:      swimmer.id,
          meeting_program: FactoryGirl.create( :meeting_program,
            meeting_event: FactoryGirl.create( :meeting_event,
              meeting_session: FactoryGirl.create( :meeting_session,
                swimming_pool: FactoryGirl.create( :swimming_pool,
                  pool_type_id: event_by_pool_type.pool_type_id )
                ),
              event_type_id: event_by_pool_type.event_type_id ),
            gender_type_id: swimmer.gender_type_id
          )
        ),
        record_type_id: 1,
        event_type_id:  event_by_pool_type.event_type_id
      )
    end
    list
  end
end
#-- ---------------------------------------------------------------------------
#++
