# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


=begin

= FinResultPhase3

  - Goggles framework vers.:  4.00.481
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

  # Total of committed data rows
  @committed_data_rows = 0
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeeting / Meeting.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_meeting( data_import_session )
    di_records = DataImportMeeting.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.description}'..." )
        begin                                       # --- BEGIN transaction ---
          Meeting.transaction do
            committed_row = Meeting.new(
              description:            di_row.description,
              entry_deadline:         di_row.entry_deadline,
              is_autofilled:          true,         # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              are_results_acquired:   di_row.are_results_acquired,
              configuration_file:     di_row.configuration_file,

              is_under_25_admitted:   di_row.is_under_25_admitted,
              max_individual_events:  di_row.max_individual_events,
              max_individual_events_per_session: di_row.max_individual_events_per_session,

              code:                   di_row.code,
              edition:                di_row.edition,
              header_date:            di_row.header_date,
              header_year:            di_row.header_year,
              is_out_of_season:       di_row.is_out_of_season,
              notes:                  di_row.notes,
              season_id:              di_row.season_id,
              edition_type_id:        di_row.edition_type_id,
              timing_type_id:         di_row.timing_type_id,

              individual_score_computation_type_id: di_row.individual_score_computation_type_id,
              relay_score_computation_type_id:      di_row.relay_score_computation_type_id,
              team_score_computation_type_id:       di_row.team_score_computation_type_id,

              user_id:                di_row.user_id
              # TODO FUTURE DEV: di_row.tag is not yet used
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_meeting_session(meeting)
          DataImportMeetingSession.where(
            data_import_meeting_id: di_row.id
          ).update_all( meeting_id: result_id )
                                                    # Update dependancy: |=> data_import_meeting_team_scores(meeting)
          DataImportMeetingTeamScore.where(
            data_import_meeting_id: di_row.id
          ).update_all( meeting_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'." )
          data_import_session.phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:1/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingSession / MeetingSession.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_session(meeting)
  #
  def commit_data_import_meeting_session( data_import_session )
    di_records = DataImportMeetingSession.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.description}'..." )
        begin                                       # --- BEGIN transaction ---
          MeetingSession.transaction do
            committed_row = MeetingSession.new(
              session_order:    di_row.session_order,
              scheduled_date:   di_row.scheduled_date,
              warm_up_time:     di_row.warm_up_time,
              begin_time:       di_row.begin_time,
              is_autofilled:    true,               # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              description:      di_row.description,
              meeting_id:       di_row.meeting_id,
              swimming_pool_id: di_row.swimming_pool_id,
              day_part_type_id: di_row.day_part_type_id,
              user_id:          di_row.user_id
              # TODO :notes is not used!
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_meeting_program(meeting_session)
          DataImportMeetingProgram.where(
            data_import_meeting_session_id: di_row.id
          ).update_all( meeting_session_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'." )
          data_import_session.phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:2/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingProgram / MeetingProgram.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_program(meeting_session)
  #
  def commit_data_import_meeting_program( data_import_session )
    di_records  = DataImportMeetingProgram.where( data_import_session_id: data_import_session.id )
    result_id   = 0
    event_order = 1
    committed_row = nil
    is_ok = true

    if di_records
      di_records.each do |di_row|                   # Create or retrieve the MeetingEvent
        mev_builder = DataImportMeetingEventBuilder.build_from_parameters(
          data_import_session,
          di_row.meeting_session,
          di_row.event_type,
          di_row.heat_type,
          event_order,
          di_row.begin_time,
          di_row.is_out_of_race
        )
        meeting_event = mev_builder.result_row
        event_order += 1 if meeting_event           # Increase event_order only after an event is created
# DEBUG
#        logger.debug( "\r\nCommitting #{ di_row.class.name } = '#{ di_row.get_short_name }'..." )
        begin                                       # --- BEGIN transaction ---
          MeetingProgram.transaction do
            committed_row = MeetingProgram.new(
              event_order:      di_row.event_order,
              category_type_id: di_row.category_type_id,
              gender_type_id:   di_row.gender_type_id,
              pool_type_id:     di_row.meeting_session.swimming_pool ? di_row.meeting_session.swimming_pool.pool_type_id : nil,
              time_standard_id: di_row.time_standard_id,
              meeting_event_id: meeting_event_id,
              begin_time:       di_row.begin_time,  # (wild-guessed)
              is_out_of_race:   di_row.is_out_of_race,
              is_autofilled:    true,               # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              user_id:          di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
# DEBUG
          logger.debug( "\r\Updating all individual results linked to this meeting program..." )
                                                    # Update dependancy: |=> data_import_meeting_individual_results(meeting_program)
          DataImportMeetingIndividualResult.where(
            data_import_meeting_program_id: di_row.id
          ).update_all( meeting_program_id: result_id )
# DEBUG
          logger.debug( "\r\Updating all relay results linked to this meeting program..." )
                                                    # Update dependancy: |=> data_import_meeting_relay_results(meeting_program)
          DataImportMeetingRelayResult.where(
            data_import_meeting_program_id: di_row.id
          ).update_all( meeting_program_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "committed_row: #{ committed_row.inspect }\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.get_short_name}'." )
          data_import_session.phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.get_short_name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:3/10"
    data_import_session.save!
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportCity / City.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_cities( data_import_session )
    di_records = DataImportCity.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.name}'..." )
        begin                                       # --- BEGIN transaction ---
          City.transaction do
            committed_row = City.new(
              name:         di_row.name,
              zip:          di_row.zip,
              area:         di_row.area,
              country:      di_row.country,
              country_code: di_row.country_code,
              user_id:      di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_teams(city)
          DataImportTeam.where(
            data_import_city_id: di_row.id
          ).update_all( city_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}'." )
          data_import_session.phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:4/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportTeam / Team / TeamAffiliation.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> teams(city)
  #
  def commit_data_import_teams( data_import_session, season )
    di_records = DataImportTeam.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = additional_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.name}'..." )
        begin                                       # --- BEGIN transaction ---
          Team.transaction do
            committed_row = Team.new(
              name:             di_row.name,
              editable_name:    di_row.name,        # (let's initialize this with the data-import name)
              name_variations:  di_row.name,
              city_id:          di_row.city_id,
              user_id:          di_row.user_id
              # TODO notes is not used
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # We must add also a new TeamAffiliation row for this season!
          TeamAffiliation.transaction do            # Create dependancy: |=> team_affiliations(team, season)
            additional_row = TeamAffiliation.new(
              name:                       committed_row.name,
              must_calculate_goggle_cup:  false,
              is_autofilled:              true,     # signal that we have guessed some of the values
              team_id:                    result_id,
              season_id:                  season.id,
              user_id:                    committed_row.user_id
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            # (ASSERT: assuming TeamAffiliation DOES NOT exist if the Team row is missing)
            additional_row.save!                    # raise automatically an exception if save is not successful
          end
                                                    # Update dependancy: |=> data_import_badges(swimmer, team, category, season)
          DataImportBadge.where( data_import_team_id: di_row.id ).update_all(
            team_id:              result_id,
            team_affiliation_id:  additional_row.id
          )
          DataImportMeetingIndividualResult.where( data_import_team_id: di_row.id ).update_all(
            team_id:              result_id,
            team_affiliation_id:  additional_row.id
          )

          DataImportMeetingRelayResult.where( data_import_team_id: di_row.id ).update_all(
            team_id:              result_id,
            team_affiliation_id:  additional_row.id
          )
          DataImportMeetingTeamScore.where( data_import_team_id: di_row.id ).update_all(
            team_id:              result_id,
            team_affiliation_id:  additional_row.id
          )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{ di_row.class.name } commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}' + #{additional_row.class.name} for Season ID #{season_id}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}' + #{additional_row.class.name} for Season ID #{season_id}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:5/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportSwimmer / Swimmer.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_swimmers( data_import_session )
    di_records = DataImportSwimmer.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.complete_name}'..." )
        begin                                       # --- BEGIN transaction ---
          Swimmer.transaction do
            committed_row = Swimmer.new(
              last_name:      di_row.last_name,
              first_name:     di_row.first_name,
              complete_name:  di_row.complete_name,
              year_of_birth:  di_row.year_of_birth,
              gender_type_id: di_row.gender_type_id,
              user_id:        di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_badges(swimmer, team, category, season)
          DataImportBadge.where(
            data_import_swimmer_id: di_row.id
          ).update_all( swimmer_id: result_id )

          DataImportMeetingIndividualResult.where(
            data_import_swimmer_id: di_row.id
          ).update_all( swimmer_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.complete_name}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.complete_name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:6/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportBadge / Badge.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> badges(swimmer, team, category, season)
  #
  def commit_data_import_badges( data_import_session )
    di_records = DataImportBadge.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.number}'..." )
        begin                                       # --- BEGIN transaction ---
          Badge.transaction do
            committed_row = Badge.new(
              number:               di_row.number,
              category_type_id:     di_row.category_type_id,
              entry_time_type_id:   di_row.entry_time_type_id,
              swimmer_id:           di_row.swimmer_id,
              team_id:              di_row.team_id,
              team_affiliation_id:  di_row.team_affiliation_id,
              season_id:            di_row.season_id,
              user_id:              di_row.user_id
            )
            # ASSERT: assuming season_id is always positive (chosen by admin during data-import)
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

          DataImportMeetingIndividualResult.where(
            data_import_badge_id: di_row.id
          ).update_all( badge_id: result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.number}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.number}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:7/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingIndividualResult / MeetingIndividualResult.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_individual_results(meeting_program)
  #
  def commit_data_import_meeting_individual_results( data_import_session )
    di_records = DataImportMeetingIndividualResult.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.athlete_name}', pts. #{di_row.meeting_individual_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingIndividualResult.transaction do
            committed_row = MeetingIndividualResult.new(
              rank:                           di_row.rank,
              is_play_off:                    di_row.is_play_off,
              is_out_of_race:                 di_row.is_out_of_race,
              is_disqualified:                di_row.is_disqualified,
              disqualification_code_type_id:  di_row.disqualification_code_type_id,
              standard_points:                di_row.standard_points,
              meeting_individual_points:      di_row.meeting_individual_points,
              team_points:                    di_row.team_points,
              goggle_cup_points:              di_row.goggle_cup_points,

              reaction_time:        di_row.reaction_time,
              minutes:              di_row.minutes,
              seconds:              di_row.seconds,
              hundreds:             di_row.hundreds,

              meeting_program_id:   di_row.meeting_program_id,
              swimmer_id:           di_row.swimmer_id,
              team_id:              di_row.team_id,
              team_affiliation_id:  di_row.team_affiliation_id,
              badge_id:             di_row.badge_id,
              user_id:              di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.athlete_name}', pts. #{committed_row.meeting_individual_points}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.athlete_name}', pts. #{committed_row.meeting_individual_points}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:8/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingRelayResult / MeetingRelayResult.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_relay_results(meeting_program)
  #
  def commit_data_import_meeting_relay_results( data_import_session )
    di_records = DataImportMeetingRelayResult.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = team_id: #{di_row.team_id}, pts. #{di_row.meeting_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingRelayResult.transaction do
            committed_row = MeetingRelayResult.new(
              meeting_program_id:   di_row.meeting_program_id,

              is_play_off:          di_row.is_play_off,
              is_out_of_race:       di_row.is_out_of_race,
              is_disqualified:      di_row.is_disqualified,
              disqualification_code_type_id: di_row.disqualification_code_type_id,
              standard_points:      di_row.standard_points,
              meeting_points:       di_row.meeting_points,

              team_id:              di_row.team_id,
              team_affiliation_id:  di_row.team_affiliation_id,
              relay_header:         di_row.relay_header,

              reaction_time:        di_row.reaction_time,
              rank:                 di_row.rank,
              minutes:              di_row.minutes,
              seconds:              di_row.seconds,
              hundreds:             di_row.hundreds,
              user_id:              di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, pts. #{committed_row.meeting_points}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:'#{result_id}', team_id: #{committed_row.team_id}, pts. #{committed_row.meeting_points}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:9/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Commit method for DataImportMeetingTeamScore / MeetingTeamScore.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_team_scores(meeting)
  #
  def commit_data_import_meeting_team_score( data_import_session )
    di_records = DataImportMeetingTeamScore.where( data_import_session_id: data_import_session.id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
        logger.debug( "\r\nCommitting #{di_row.class.name} = team_id: #{di_row.team_id}, sum_indiv.=#{di_row.sum_individual_points} sum_team=#{di_row.sum_team_points} sum_relay=#{di_row.sum_relay_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingTeamScore.transaction do
            committed_row = MeetingTeamScore.new(
              meeting_id:             di_row.meeting_id,
              team_id:                di_row.team_id,
              team_affiliation_id:    di_row.team_affiliation_id,
              rank:                   di_row.rank,
              sum_individual_points:  di_row.sum_individual_points,
              sum_relay_points:       di_row.sum_relay_points,
              sum_team_points:        di_row.sum_team_points,
              # :meeting_individual_points=> TODO
              # :meeting_relay_points     => TODO
              # :meeting_team_points      => TODO
              # :season_individual_points => TODO
              # :season_relay_points      => TODO
              # :season_team_points       => TODO
              season_id:              di_row.season_id,
              user_id:                di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          data_import_session.phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, sum_indiv.=#{di_row.sum_individual_points} sum_team=#{di_row.sum_team_points} sum_relay=#{di_row.sum_relay_points}..." )
          data_import_session.phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, sum_indiv.=#{di_row.sum_individual_points} sum_team=#{di_row.sum_team_points} sum_relay=#{di_row.sum_relay_points}...\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    data_import_session.phase_3_log = "COMMIT:10/10"
    data_import_session.save!
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end