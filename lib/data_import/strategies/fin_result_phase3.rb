# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'data_import/services/data_import_entity_committer'


=begin

= FinResultPhase3

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

  Data-Import/Commit Module incapsulating all committing methods
  to create new entity records inside the database, assuming
  the results from the digest ("phase 2") have already been stored
  into dedicated "data_import_XYZ" tables (one for each entity that has
  been processed).

  Refactored from the original DataImportController implementation.

  === Defines:
  - @committed_data_rows integer variable

=end
module FinResultPhase3

# FIXME:
  # Total of committed data rows
  @committed_data_rows = 0
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeeting |=> Meeting.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => Season
  #
  #   === Children:
  #     => DataImportMeetingSession
  #     => DataImportMeetingTeamScore
  #
  def commit_data_import_meeting( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeeting, 1 )
    committer.commit do |source_row|
      Meeting.transaction do
        committed_row = Meeting.new(
          description:                          source_row.description,
          entry_deadline:                       source_row.entry_deadline,
          are_results_acquired:                 source_row.are_results_acquired,
          configuration_file:                   source_row.configuration_file,

          is_under_25_admitted:                 source_row.is_under_25_admitted,
          max_individual_events:                source_row.max_individual_events,
          max_individual_events_per_session:    source_row.max_individual_events_per_session,

          code:                                 source_row.code,
          edition:                              source_row.edition,
          header_date:                          source_row.header_date,
          header_year:                          source_row.header_year,
          is_out_of_season:                     source_row.is_out_of_season,
          notes:                                source_row.notes,
          season_id:                            source_row.season_id,
          edition_type_id:                      source_row.edition_type_id,
          timing_type_id:                       source_row.timing_type_id,
          individual_score_computation_type_id: source_row.individual_score_computation_type_id,
          relay_score_computation_type_id:      source_row.relay_score_computation_type_id,
          team_score_computation_type_id:       source_row.team_score_computation_type_id,
          is_autofilled:                        true, # signal that we have guessed some of the values (for instance, the begin/scheduled times)
          user_id:                              source_row.user_id
          # (FUTURE DEV: source_row.tag is not yet used)
        )
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportMeetingSession.where( data_import_meeting_id: source_row.id )
        .update_all( meeting_id: committed_row.id )
      DataImportMeetingTeamScore.where( data_import_meeting_id: source_row.id )
        .update_all( meeting_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingSession |=> MeetingSession.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => Meeting
  #
  #   === Children:
  #     => DataImportMeetingProgram
  #
  def commit_data_import_meeting_session( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingSession, 2 )
    committer.commit do |source_row|
      MeetingSession.transaction do
        committed_row = MeetingSession.new(
          session_order:    source_row.session_order,
          scheduled_date:   source_row.scheduled_date,
          warm_up_time:     source_row.warm_up_time,
          begin_time:       source_row.begin_time,
          is_autofilled:    true,               # signal that we have guessed some of the values (for instance, the begin/scheduled times)
          description:      source_row.description,
          meeting_id:       source_row.meeting_id,
          swimming_pool_id: source_row.swimming_pool_id,
          day_part_type_id: source_row.day_part_type_id,
          user_id:          source_row.user_id
          # (notes is not used)
        )
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportMeetingProgram.where( data_import_meeting_session_id: source_row.id )
        .update_all( meeting_session_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingProgram |=> MeetingProgram.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => MeetingSession
  #
  #   === Children:
  #     => DataImportMeetingIndividualResult
  #     => DataImportMeetingRelayResult
  #
  def commit_data_import_meeting_program( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingProgram, 3 )
    event_num_memo = 1
    committer.commit( event_num_memo ) do |source_row, event_order|
      MeetingProgram.transaction do                 # Create the MeetingEvent first, if missing:
        mev_builder = DataImportMeetingEventBuilder.build_from_parameters(
          data_import_session,
          source_row.meeting_session,
          source_row.event_type,
          source_row.heat_type,
          event_order,
          source_row.begin_time,
          source_row.is_out_of_race
        )
        meeting_event = mev_builder.result_row
# TODO This must be tested:
        event_order += 1 if meeting_event           # Increase event_order only after an event is created

        committed_row = MeetingProgram.new(
          event_order:      source_row.event_order,
          category_type_id: source_row.category_type_id,
          gender_type_id:   source_row.gender_type_id,
          pool_type_id:     source_row.meeting_session.swimming_pool ? source_row.meeting_session.swimming_pool.pool_type_id : nil,
          time_standard_id: source_row.time_standard_id,
          meeting_event_id: meeting_event_id,
          begin_time:       source_row.begin_time,  # (wild-guessed)
          is_out_of_race:   source_row.is_out_of_race,
          is_autofilled:    true,                   # signal that we have guessed some of the values (for instance, the begin/scheduled times)
          user_id:          source_row.user_id
        )
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportMeetingIndividualResult.where( data_import_meeting_program_id: source_row.id )
        .update_all( meeting_program_id: committed_row.id )
      DataImportMeetingRelayResult.where( data_import_meeting_program_id: source_row.id )
        .update_all( meeting_program_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportCity |=> City.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #   - none
  #
  #   === Children:
  #     => DataImportTeam
  #
  def commit_data_import_cities( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportCity, 4 )
    committer.commit do |source_row|
      City.transaction do
        committed_row = City.new(
          name:         source_row.name,
          zip:          source_row.zip,
          area:         source_row.area,
          country:      source_row.country,
          country_code: source_row.country_code,
          user_id:      source_row.user_id
        )
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportTeam.where( data_import_city_id: source_row.id )
        .update_all( city_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportTeam |=> Team + TeamAffiliation.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => City (Team)
  #     => Team (TeamAffiliation)
  #     => Season (TeamAffiliation)
  #
  #   === Children:
  #     => DataImportBadge
  #     => DataImportMeetingIndividualResult
  #     => DataImportMeetingRelayResult
  #     => DataImportMeetingTeamScore
  #
  def commit_data_import_teams( data_import_session, season )
    # ASSERT: assuming TeamAffiliation DOES NOT exist if the Team row is missing.
    #         (i.e.: this should be the DataImportTeam row condition of existance)
    committer = DataImportEntityCommitter.new( data_import_session, DataImportTeam, 5 )
    committer.commit do |source_row|
      Team.transaction do
        committed_row = Team.new(
          name:             source_row.name,
          editable_name:    source_row.name,        # (We'll set this with the data-import name)
          name_variations:  source_row.name,
          city_id:          source_row.city_id,
          user_id:          source_row.user_id
          # (notes is not used)
        )
        committed_row.save!
      end
                                                    # We must add also a new TeamAffiliation row for this season:
      TeamAffiliation.transaction do                # Create dependancy: |=> team_affiliations(team, season)
        @additional_row = TeamAffiliation.new(
          name:                       committed_row.name,
          must_calculate_goggle_cup:  false,
          is_autofilled:              true,         # signal that we have guessed some of the values
          team_id:                    committed_row.id,
          season_id:                  season.id,
          user_id:                    committed_row.user_id
          # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
        )
        @additional_row.save!
        # [Steve, 20141024] By using @additional_row we'll signal to the #commit method
        # that we are actually committing another row beside the main result of the
        # block.
      end
                                                    # Update dependancies:
      DataImportBadge.where( data_import_team_id: source_row.id )
        .update_all(
          team_id:              committed_row.id,
          team_affiliation_id:  @additional_row.id
        )
      DataImportMeetingIndividualResult.where( data_import_team_id: source_row.id )
        .update_all(
          team_id:              committed_row.id,
          team_affiliation_id:  @additional_row.id
        )
      DataImportMeetingRelayResult.where( data_import_team_id: source_row.id )
        .update_all(
          team_id:              committed_row.id,
          team_affiliation_id:  @additional_row.id
        )
      DataImportMeetingTeamScore.where( data_import_team_id: source_row.id )
        .update_all(
          team_id:              committed_row.id,
          team_affiliation_id:  @additional_row.id
        )
      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportSwimmer |=> Swimmer.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Children:
  #     => DataImportBadge
  #     => DataImportMeetingIndividualResult
  #
  def commit_data_import_swimmers( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportSwimmer, 6 )
    committer.commit do |source_row|
      Swimmer.transaction do
        committed_row = Swimmer.new(
          last_name:      source_row.last_name,
          first_name:     source_row.first_name,
          complete_name:  source_row.complete_name,
          year_of_birth:  source_row.year_of_birth,
          gender_type_id: source_row.gender_type_id,
          user_id:        source_row.user_id
        )
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportBadge.where( data_import_swimmer_id: source_row.id )
        .update_all( swimmer_id: committed_row.id )

      DataImportMeetingIndividualResult.where( data_import_swimmer_id: source_row.id )
        .update_all( swimmer_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportBadge |=> Badge.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => Swimmer
  #     => Team
  #     => TeamAffiliation
  #     => Season
  #
  #   === Children:
  #     => DataImportMeetingIndividualResult
  #
  def commit_data_import_badges( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportBadge, 7 )
    committer.commit do |source_row|
      Badge.transaction do
        committed_row = Badge.new(
          number:               source_row.number,
          category_type_id:     source_row.category_type_id,
          entry_time_type_id:   source_row.entry_time_type_id,
          swimmer_id:           source_row.swimmer_id,
          team_id:              source_row.team_id,
          team_affiliation_id:  source_row.team_affiliation_id,
          season_id:            source_row.season_id,
          user_id:              source_row.user_id
        )
        # ASSERT: assuming season.instance_of?( Season ) (chosen by admin during data-import)
        committed_row.save!
      end
                                                    # Update dependancies:
      DataImportMeetingIndividualResult.where( data_import_badge_id: source_row.id )
        .update_all( badge_id: committed_row.id )

      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingIndividualResult |=> MeetingIndividualResult.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => MeetingProgram
  #     => Swimmer
  #     => Team
  #     => TeamAffiliation
  #     => Badge
  #
  #   === Children:
  #     - none (hierachy leaf)
  #
  def commit_data_import_meeting_individual_results( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingIndividualResult, 8 )
    committer.commit do |source_row|
      MeetingIndividualResult.transaction do
        committed_row = MeetingIndividualResult.new(
          rank:                           source_row.rank,
          is_play_off:                    source_row.is_play_off,
          is_out_of_race:                 source_row.is_out_of_race,
          is_disqualified:                source_row.is_disqualified,
          disqualification_code_type_id:  source_row.disqualification_code_type_id,
          standard_points:                source_row.standard_points,
          meeting_individual_points:      source_row.meeting_individual_points,
          team_points:                    source_row.team_points,
          goggle_cup_points:              source_row.goggle_cup_points,

          reaction_time:                  source_row.reaction_time,
          minutes:                        source_row.minutes,
          seconds:                        source_row.seconds,
          hundreds:                       source_row.hundreds,

          meeting_program_id:             source_row.meeting_program_id,
          swimmer_id:                     source_row.swimmer_id,
          team_id:                        source_row.team_id,
          team_affiliation_id:            source_row.team_affiliation_id,
          badge_id:                       source_row.badge_id,
          user_id:                        source_row.user_id
        )
        committed_row.save!
      end
      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingRelayResult |=> MeetingRelayResult.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => MeetingProgram
  #     => Team
  #     => TeamAffiliation
  #
  #   === Children:
  #     - none (hierachy leaf)
  #
  def commit_data_import_meeting_relay_results( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingRelayResult, 9 )
    committer.commit do |source_row|
      MeetingRelayResult.transaction do
        committed_row = MeetingRelayResult.new(
          meeting_program_id:             source_row.meeting_program_id,

          is_play_off:                    source_row.is_play_off,
          is_out_of_race:                 source_row.is_out_of_race,
          is_disqualified:                source_row.is_disqualified,
          disqualification_code_type_id:  source_row.disqualification_code_type_id,
          standard_points:                source_row.standard_points,
          meeting_points:                 source_row.meeting_points,

          team_id:                        source_row.team_id,
          team_affiliation_id:            source_row.team_affiliation_id,
          relay_header:                   source_row.relay_header,

          reaction_time:                  source_row.reaction_time,
          rank:                           source_row.rank,
          minutes:                        source_row.minutes,
          seconds:                        source_row.seconds,
          hundreds:                       source_row.hundreds,
          user_id:                        source_row.user_id
        )
        committed_row.save!
      end
      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingTeamScore |=> MeetingTeamScore.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancies:
  #   === Direct Parents:
  #     => Season
  #     => Meeting
  #     => Team
  #     => TeamAffiliation
  #
  #   === Children:
  #     - none (hierachy leaf)
  #
  def commit_data_import_meeting_team_score( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingTeamScore, 10 )
    committer.commit do |source_row|
      MeetingTeamScore.transaction do
        committed_row = MeetingTeamScore.new(
          meeting_id:                   source_row.meeting_id,
          team_id:                      source_row.team_id,
          team_affiliation_id:          source_row.team_affiliation_id,
          rank:                         source_row.rank,
          sum_individual_points:        source_row.sum_individual_points,
          sum_relay_points:             source_row.sum_relay_points,
          sum_team_points:              source_row.sum_team_points,
          # meeting_individual_points:  TODO
          # meeting_relay_points:       TODO
          # meeting_team_points:        TODO
          # season_individual_points:   TODO
          # season_relay_points:        TODO
          # season_team_points:         TODO
          season_id:                    source_row.season_id,
          user_id:                      source_row.user_id
        )
        committed_row.save!
      end
      committed_row                                 # Return the currently committed row
    end
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++
end