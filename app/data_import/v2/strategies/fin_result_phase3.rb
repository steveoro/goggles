# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'common/validation_error_tools'

require_relative '../../../data_import/v2/services/data_import_entity_committer'


=begin

= FinResultPhase3

  - Goggles framework vers.:  4.00.759
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

  # Total of committed data rows. Increased internally by each one of the following methods.
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
                                                    # Update dependancies:
        DataImportMeetingSession.where( data_import_meeting_id: source_row.id )
          .update_all( meeting_id: committed_row.id )
        DataImportMeetingTeamScore.where( data_import_meeting_id: source_row.id )
          .update_all( meeting_id: committed_row.id )

        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
                                                    # Update dependancies:
        DataImportMeetingProgram.where( data_import_meeting_session_id: source_row.id )
          .update_all( meeting_session_id: committed_row.id )

        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
  #     => DataImportMeetingEntry
  #     => DataImportMeetingIndividualResult
  #     => DataImportMeetingRelayResult
  #
  def commit_data_import_meeting_program( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingProgram, 3 )
    committer.commit do |source_row|                # Get previously stored meeting event, if available
      last_event  = source_row.meeting_session.meeting.meeting_events.order(:event_order).last
      event_order = last_event ? last_event.event_order + 1 : 1

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
        raise ArgumentError.new("MeetingEvent was not found or not created!") unless meeting_event.instance_of?(MeetingEvent)

        if meeting_event.invalid?                   # Check validation for meeting events first:
          msg = "\r\n*** commit_data_import_meeting_program(): ERROR: validation failed during MeetingEvent creation!\r\n" <<
            "- event_order.....: #{event_order}\r\n" <<
            "- source_row......: #{source_row.inspect}\r\n" <<
            "- meeting_event...: #{meeting_event.inspect}.\r\n" <<
            ValidationErrorTools.recursive_error_for( meeting_event )
          data_import_session.phase_2_log << msg
# DEBUG
#          puts msg
        end

        committed_row = MeetingProgram.new(
          event_order:      source_row.event_order,
          category_type_id: source_row.category_type_id,
          gender_type_id:   source_row.gender_type_id,
          pool_type_id:     source_row.meeting_session.swimming_pool ? source_row.meeting_session.swimming_pool.pool_type_id : nil,
          time_standard_id: source_row.time_standard_id,
          meeting_event_id: meeting_event.id,
          begin_time:       source_row.begin_time,  # (wild-guessed)
          is_out_of_race:   source_row.is_out_of_race,
          is_autofilled:    true,                   # signal that we have guessed some of the values (for instance, the begin/scheduled times)
          user_id:          source_row.user_id
        )
        committed_row.save!
                                                    # Update dependancies:
        DataImportMeetingEntry.where( data_import_meeting_program_id: source_row.id )
          .update_all( meeting_program_id: committed_row.id )

        DataImportMeetingIndividualResult.where( data_import_meeting_program_id: source_row.id )
          .update_all( meeting_program_id: committed_row.id )

        DataImportMeetingRelayResult.where( data_import_meeting_program_id: source_row.id )
          .update_all( meeting_program_id: committed_row.id )

        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
                                                    # Update dependancies:
        DataImportTeam.where( data_import_city_id: source_row.id )
          .update_all( city_id: committed_row.id )

        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
  #     => DataImportMeetingEntry
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
        # We must add also a new TeamAffiliation row for this season:
        # Create dependancy: |=> team_affiliations(team, season)
        ta_builder = DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          committed_row,
          season
        )
        team_affiliation = ta_builder.result_row
                                                    # Update dependancies:
        DataImportBadge.where( data_import_team_id: source_row.id )
          .update_all(
            team_id:              committed_row.id,
            team_affiliation_id:  team_affiliation.id
          )
        DataImportMeetingEntry.where( data_import_team_id: source_row.id )
          .update_all(
            team_id:              committed_row.id,
            team_affiliation_id:  team_affiliation.id
          )
        DataImportMeetingIndividualResult.where( data_import_team_id: source_row.id )
          .update_all(
            team_id:              committed_row.id,
            team_affiliation_id:  team_affiliation.id
          )
        DataImportMeetingRelayResult.where( data_import_team_id: source_row.id )
          .update_all(
            team_id:              committed_row.id,
            team_affiliation_id:  team_affiliation.id
          )
        DataImportMeetingTeamScore.where( data_import_team_id: source_row.id )
          .update_all(
            team_id:              committed_row.id,
            team_affiliation_id:  team_affiliation.id
          )

        @additional_row = team_affiliation          # Set the additional row that we'll be added to the SQL diff
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
  #     => DataImportMeetingEntry
  #     => DataImportMeetingIndividualResult
  #
  def commit_data_import_swimmers( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportSwimmer, 6 )
    committer.commit do |source_row|
# DEBUG
#      puts "\r\nCommitting #{source_row.inspect}\r\n- source_row.gender_type_id: #{source_row.gender_type_id}"
      check_for_non_nil_links( source_row, [:gender_type_id] )
      raise ArgumentError.new("DataImportSwimmer ID#{source_row.id} found with gender_type_id NULL during phase#3!") unless source_row.gender_type_id.to_i > 0
      Swimmer.transaction do
                                                    # Check for year range in import-text:
        year_range = source_row.import_text.to_s.split(',').last
        is_year_guessed = ( year_range.to_s.split('-').size > 1 )
                                                    # Prepare & commit the row:
        committed_row = Swimmer.new(
          last_name:        source_row.last_name,
          first_name:       source_row.first_name,
          complete_name:    source_row.complete_name,
          year_of_birth:    source_row.year_of_birth,
          gender_type_id:   source_row.gender_type_id,
          is_year_guessed:  is_year_guessed,
          user_id:          source_row.user_id
        )
        committed_row.save!
                                                    # Update dependancies:
        DataImportBadge.where( data_import_swimmer_id: source_row.id )
          .update_all( swimmer_id: committed_row.id )

        DataImportMeetingEntry.where( data_import_swimmer_id: source_row.id )
          .update_all( swimmer_id: committed_row.id )

        DataImportMeetingIndividualResult.where( data_import_swimmer_id: source_row.id )
          .update_all( swimmer_id: committed_row.id )

# DEBUG
#        puts "=> returning: #{committed_row.inspect}"
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
  #     => DataImportMeetingEntry
  #     => DataImportMeetingIndividualResult
  #
  def commit_data_import_badges( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportBadge, 7 )
    committer.commit do |source_row|
# FIXME Having season & team we could add here a fix if :team_affiliation_id is found missing
# (instead of raising an error like the following method does)
      check_for_non_nil_links( source_row, [:swimmer_id, :team_id, :team_affiliation_id, :season_id] )
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
                                                    # Update dependancies:
        DataImportMeetingEntry.where( data_import_badge_id: source_row.id )
          .update_all( badge_id: committed_row.id )

        DataImportMeetingIndividualResult.where( data_import_badge_id: source_row.id )
          .update_all( badge_id: committed_row.id )

        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
  def commit_data_import_meeting_entries( data_import_session )
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingEntry, 8 )
    committer.commit do |source_row|
      check_for_non_nil_links(
        source_row,
        [:meeting_program_id, :swimmer_id, :team_id, :team_affiliation_id, :badge_id]
      )
      MeetingEntry.transaction do
        committed_row = MeetingEntry.new(
          start_list_number:              source_row.start_list_number,
          lane_number:                    source_row.lane_number,
          heat_number:                    source_row.heat_number,
          heat_arrival_order:             source_row.heat_arrival_order,
          entry_time_type_id:             source_row.entry_time_type_id,

          minutes:                        source_row.minutes,
          seconds:                        source_row.seconds,
          hundreds:                       source_row.hundreds,
          is_no_time:                     source_row.is_no_time,

          meeting_program_id:             source_row.meeting_program_id,
          swimmer_id:                     source_row.swimmer_id,
          team_id:                        source_row.team_id,
          team_affiliation_id:            source_row.team_affiliation_id,
          badge_id:                       source_row.badge_id,
          user_id:                        source_row.user_id
        )
        committed_row.save!
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingIndividualResult, 9 )
    committer.commit do |source_row|
      check_for_non_nil_links(
        source_row,
        [:meeting_program_id, :swimmer_id, :team_id, :team_affiliation_id, :badge_id]
      )
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
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingRelayResult, 10 )
    committer.commit do |source_row|
      check_for_non_nil_links( source_row, [:meeting_program_id, :team_id, :team_affiliation_id] )
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
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
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
    committer = DataImportEntityCommitter.new( data_import_session, DataImportMeetingTeamScore, 11 )
    committer.commit do |source_row|
      check_for_non_nil_links( source_row, [:meeting_id, :team_id, :team_affiliation_id, :season_id] )
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
        committed_row                               # Return the currently committed row
      end
    end
    @committed_data_rows += committer.committed_data_rows
    committer.is_ok?
  end
  #-- -------------------------------------------------------------------------
  #++


  # This method updates the #are_results_acquired flag and #has_start_list flags
  # for the Meeting instance associated with the #data_import_session specified,
  # but only if any individual results or meeting entries are associated to the
  # Meeting found.
  #
  # Returns the Meeting instance on success (even when no actions are done), or
  # +nil+ when it's unable to find the associated Meeting (which should be already
  # committed by phase 3 in orderfor this to work).
  #
  # *WARNING:*
  # This implementation will work ONLY if the data import session contains at least a
  # data_import_meeting_programs row.
  #
  def update_meeting_flags( data_import_session, flag_status = true )
    meeting = nil
    mprg = DataImportMeetingProgram.where( data_import_session_id: data_import_session.id ).first
# DEBUG
#    puts "\r\n- update_meeting_flags:\r\n1) M.Program = #{mprg.class} ##{mprg ? mprg.id : ''}"
    unless mprg
      di_mir = DataImportMeetingIndividualResult.where( data_import_session_id: data_import_session.id ).first
# DEBUG
#      puts "2) MIR = #{di_mir.class} ##{di_mir ? di_mir.id : ''}"
      mprg = di_mir && ( di_mir.meeting_program || di_mir.data_import_meeting_program )
    end
# DEBUG
#    puts "3) M.Program = #{mprg.class} ##{mprg ? mprg.id : ''}"
    ms = mprg && ( mprg.meeting_session || ( mprg.respond_to?(:data_import_meeting_session) && mprg.data_import_meeting_session ) )
# DEBUG
#    puts "4) M.Session = #{ms.class} ##{ms ? ms.id : ''}"
    meeting = ms && ms.meeting
# DEBUG
#    puts "5) Meeting = #{meeting.class} ##{ms ? meeting.id : ''}"

    if meeting.instance_of?( Meeting )
      # Update the are_results_acquired flag ONLY if results where actually imported
      # and the Meeting is already committed:
      if meeting.meeting_individual_results.count > 0
        meeting.are_results_acquired = flag_status
        meeting.save!
        data_import_session.sql_diff ||= ''
        data_import_session.sql_diff << "\r\n-- Meeting #{meeting.id}" <<
          "\r\n-- 'Results acquired' flag setting:" <<
          "\r\nUPDATE meetings SET are_results_acquired = '1' WHERE id = #{meeting.id};\r\n\r\n"
# DEBUG
#        puts "=> Meeting.are_results_acquired: #{meeting.are_results_acquired}"
      end

      # Update the has_start_list flag ONLY if entries where actually imported
      # and the Meeting is already committed:
      if meeting.meeting_entries.count > 0
        meeting.has_start_list = flag_status
        meeting.save!
        data_import_session.sql_diff ||= ''
        data_import_session.sql_diff << "\r\n-- Meeting #{meeting.id}" <<
          "\r\n-- 'has_start_list' flag setting:" <<
          "\r\nUPDATE meetings SET has_start_list = '1' WHERE id = #{meeting.id};\r\n\r\n"
# DEBUG
#        puts "=> Meeting.has_start_list: #{meeting.has_start_list}"
      end
      meeting
    else
      nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
