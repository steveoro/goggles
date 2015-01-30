# encoding: utf-8

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/strategies/sql_converter'
require_relative '../../../app/strategies/entity_row_dup_collector'


=begin

= TeamMerger

  - Goggles framework vers.:  4.00.731
  - author: Steve A.

  Service class delegated to merge a source/slave Team into a destination/master one.

  The source Team will become a name-alias of the destionation.
  All linked entities and sub-entities will refer to the 'master' Team after the
  process.
  Thus the process itself is quite irreversible for the destination DB and a backup
  is strongly recommended before proceeding.


=== Typical usage:

 - create and memoize an instance of the merger class;

 - launch the process (beware that it will modify directly the Database);

 - retrieve the logs using the member variables.

=end
class TeamMerger
  include SqlConverter

  # Returns the overall text log for all the operations performed with this instance.
  # It is never +nil+, empty at first.
  #
  def process_text_log
    @process_text_log ||= "\t*****************************\r\n\t     Team Merge Report\r\n\t*****************************\r\n"
  end

  # Returns the overall SQL diff/log for all the SQL operations that should
  # be carried out by for replicating the changes (already done by this instance) on
  # another instance of the same Database (for example, to apply the changes on
  # a production DB after testing them on a staging version of the same DB).
  # It is never +nil+, empty at first.
  #
  def sql_diff_text_log
    @sql_diff_text_log ||= ''
  end
  # ----------------------------------------------------------------------------
  #++


  # Launches the merge process for a source/slave Team instance, against a master/
  # destination Team instance.
  #
  # The source Team will simply become a name alias for the destination Team and
  # all its linked entities and sub-enties rows will then refer to the actual
  # 'master'(destination) Team ID.
  # The process does nothing if the Team's IDs are equal.
  #
  # Keep in mind also that this will alter directly the database and it will work
  # indipendently from season or affiliation: when two teams are processed to be
  # merged, ALL THEIR LINKED entities will be scanned and altered, in a way or
  # another.
  #
  # Returns +true+ if no problems are found, +false+ otherwise.
  #
  def process( slave_team, master_team )
    raise ArgumentError.new( "slave_team must be an instance of Team!" ) unless slave_team.instance_of?( Team )
    raise ArgumentError.new( "master_team must be an instance of Team!" ) unless master_team.instance_of?( Team )
    return true if slave_team.id == master_team.id  # Skip process when the teams are the same
    is_ok = true

    process_text_log << "\r\nMerging '#{slave_team.name}' (id: #{slave_team.id}) => '#{master_team.name}' (id: #{master_team.id})...\r\n\r\n"
    sql_diff_text_log << "-- Merging '#{slave_team.name}' (id: #{slave_team.id}) => '#{master_team.name}' (id: #{master_team.id})...\r\n\r\n"

    # Regarding updates or deletions of :badge_id and :team_affiliation_id:
    # --------------------------------------------------------------------
    # These two have to change only if they refer to a duplicate row;
    # that is, a row that will become a duplicate (and it will have to
    # be deleted) once that the update (and translation) process has been
    # completed.
    #
    # Thus, each linked entity that has a reference to one of these
    # possibly duplicate IDs has to be updated with the new destination value
    # (of which they are the duplicate); else, the value for :badge_id and
    # :team_affiliation_id can stay untouched.

    # [Steve, 20131126] Having dest.Team id overwriting src Team id:
    # => duplicates must be identified and safely removed afterwards
    # => non-duplicates must be updated with the new values
    # - collect non-duplicates (new) TeamAffiliation
    # - collect duplicates TeamAffiliation
    #   - duplicate row must be converted to equivalent destination (the one they are the duplicate of)
    #   - destination value must be used for update
    #   - duplicate row can then be safely removed
    # - collect non-duplicates (new) Badge
    # - collect duplicates Badge
    #   - proceed as above [...]
    # All other linked entites have similar dependencies:...

    # => foreach non-duplicate DataImportTeamAlias: update them (team_id)
    #   => delete remaining duplicates
    # => foreach non-duplicate GoggleCup: update them (team_id)
    #   => delete remaining duplicates

    # => process non-duplicate Badges and update them (one by one)
    #    for each new Badge, find and update its linked:
    #     => MeetingRelaySwimmer (:badge_id)
    #     => GoggleCupStandard (:badge_id)
    #     => Passage (:badge_id)
    #     => MeetingIndividualResult (:badge_id, :team_id (corrected), :team_affiliation_id(corrected))
    #    for each duplicate Badge, find and delete its linked:
    #     => MeetingRelaySwimmer (:badge_id)
    #     => GoggleCupStandard (:badge_id)
    #     => Passage (:badge_id)
    #     => MeetingIndividualResult (:badge_id, :team_id (corrected), :team_affiliation_id(corrected))

    # => process non-duplicate TeamAffiliations and update them (one by one)
    #    for each non-duplicate TeamAffiliation, find and update its linked:
    #     => MeetingRelayResult and update them (:team_id, :team_affiliation_id)
    #     => MeetingTeamScore and update them (:team_id, :team_affiliation_id)
    #    for each duplicate TeamAffiliation, find and delete its linked:
    #     => MeetingRelayResult and update them (:team_id, :team_affiliation_id)
    #     => MeetingTeamScore and update them (:team_id, :team_affiliation_id)

=begin
 TODO
 - Refactor the following shit this way:

    - use member variables for each collector
    - use member variables for each translation hash
    - remove useless parameters from method calls

    - divide into 4 phases/methods
      1) collect
      2) update
      3) create alias
      4) delete
=end
                                                    # ===  TeamAffiliation  ===
    dest_taffs = TeamAffiliation.where( team_id: master_team.id )
    src_taffs = TeamAffiliation.where( team_id: slave_team.id )
                                                    # Separate duplicates from new (updatable) rows:
    dest_season_ids = dest_taffs.collect{ |row| row.season_id }
    duplicates_src_taffs = TeamAffiliation.where( team_id: slave_team.id, season_id: dest_season_ids )
    duplicates_src_taffs_ids = duplicates_src_taffs.collect{ |row| row.id }

    src_taffs_ids = src_taffs.collect { |row| row.id }
    nonduplicates_src_taffs_ids = src_taffs_ids.reject { |id| duplicates_src_taffs_ids.member?(id) }
    nonduplicates_src_taffs = src_taffs.reject { |row| duplicates_src_taffs_ids.member?(row.id) }
    # Compose a duplicate-translation hash, with the src TeamAffiliation.id as key
    # and destination TeamAffiliation.id as value:
    dup_taff_matrix_ids = {}                  # This will allow: src key id |=> dest value id
    duplicates_src_taffs.each do |src_taff_row|
      # ASSERT: there's only 1 TeamAffiliation for each (team_id, season_id) pair
      dest_taffs_candidate = dest_taffs.find{ |r| src_taff_row.season_id == r.season_id }
      dup_taff_matrix_ids[ src_taff_row.id ] = dest_taffs_candidate.id
    end
    log_row_sizes( TeamAffiliation, :name, duplicates_src_taffs, nonduplicates_src_taffs )

                                                    # ===  Badge  ===
    badge_collector = EntityRowDupCollector.new( Badge )
    team_filter = ->(id) { where( team_id: id ) }

    badge_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.swimmer_id == src_row.swimmer_id) &&
      (dest_row.season_id == src_row.season_id)
    end

    dup_badge_matrix_ids = {}                 # This will allow: src key id |=> dest value id
    badge_collector.duplicate_rows.each do |src_badge_row|
      dest_badge_candidate = badge_collector.dest_rows.find do |dest_row|
        (src_badge_row.swimmer_id == dest_row.swimmer_id) &&
        (src_badge_row.season_id == dest_row.season_id)
      end
      dup_badge_matrix_ids[ src_badge_row.id ] = dest_badge_candidate.id
    end
    log_row_sizes( Badge, :get_full_name, badge_collector.duplicate_rows, badge_collector.non_duplicates_rows )

                                                    # ===  Swimmers  ===
    src_swimmers_ids  = badge_collector.source_rows.collect{ |row| row.swimmer_id }
    dest_swimmers_ids = badge_collector.dest_rows.collect{ |row| row.swimmer_id }

                                                    # ===  DataImportTeamAlias (:team_id)  ===
    alias_collector = EntityRowDupCollector.new( DataImportTeamAlias )
    alias_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.name == src_row.name)
    end
    log_row_sizes( DataImportTeamAlias, :name, alias_collector.duplicate_rows, alias_collector.non_duplicates_rows )

                                                    # ===  GoggleCup (:team_id)  ===
    gcup_collector = EntityRowDupCollector.new( GoggleCup )
    gcup_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.year == src_row.year)
    end
    log_row_sizes( GoggleCup, :year, gcup_collector.duplicate_rows, gcup_collector.non_duplicates_rows )

    # [Steve, 20131128] The remaining linked entites (MeetingRelaySwimmer, MeetingIndividualResult,
    # MeetingRelayResult, ...) may contain rows that have been added separately from the creation
    # of the source/destination team. Thus, the following entites may have rows that refer to
    # a "duplicate" Team/TeamAffiliation/Badge, but that are indeed new or updatable as well.
    # The only safe way to check this, is to process them one by one, during update, and compare
    # them for possible duplicate after update; if the row will result in a duplicate, it must be
    # deleted.
                                                    # ===  MeetingIndividualResult (:badge_id, :team_id, :team_affiliation_id)  ===
    mir_collector = EntityRowDupCollector.new( MeetingIndividualResult )
    mir_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    log_row_sizes( MeetingIndividualResult, :get_full_name, mir_collector.duplicate_rows, mir_collector.non_duplicates_rows )

                                                    # ===  MeetingRelayResult (:team_id, :team_affiliation_id)  ===
    mrr_collector = EntityRowDupCollector.new( MeetingRelayResult )
    mrr_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    log_row_sizes( MeetingRelayResult, :get_full_name, mrr_collector.duplicate_rows, mrr_collector.non_duplicates_rows, true ) # log also non-duplicates (these should be few, usually)

                                                    # ===  MeetingTeamScore (:team_id, :team_affiliation_id)  ===
    mts_collector = EntityRowDupCollector.new( MeetingRelayResult )
    mts_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_id == src_row.meeting_id)
    end
    log_row_sizes( MeetingTeamScore, :get_full_name, mts_collector.duplicate_rows, mts_collector.non_duplicates_rows )

                                                    # ===  MeetingRelaySwimmer (:badge_id)  ===
    src_badges_ids  = badge_collector.source_rows.collect{ |row| row.id }
    dest_badges_ids = badge_collector.dest_rows.collect{ |row| row.id }
    mrs_collector = EntityRowDupCollector.new( MeetingRelaySwimmer )
    badge_filter = ->(badges_ids) { includes(:badge).where( badge_id: badges_ids ) }

    mrs_collector.process( src_badges_ids, badge_filter, dest_badges_ids, badge_filter ) do |src_row, dest_row|
      (dest_row.meeting_relay_result_id == src_row.meeting_relay_result_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    log_row_sizes( MeetingRelaySwimmer, :get_full_name, mrs_collector.duplicate_rows, mrs_collector.non_duplicates_rows )

                                                    # ===  Passage (:swimmer_id, :team_id)  ===
    pass_collector = EntityRowDupCollector.new( Passage )
    pass_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
#################### TODO TEST the above (removed swimmer dependency, which shuold be useless) -- follows old version:
    # src_pass  = Passage.where( team_id: slave_team.id, swimmer_id: src_swimmers_ids )
    # dest_pass = Passage.where( team_id: master_team.id, swimmer_id: dest_swimmers_ids )
    # nonduplicates_src_pass = src_pass.reject do |src_row|
      # dest_pass.any? do |dest_row|
        # (dest_row.meeting_program_id == src_row.meeting_program_id) &&
        # (dest_row.swimmer_id == src_row.swimmer_id)
      # end
    # end
    # duplicates_src_pass = src_pass.reject do |src_row|
      # nonduplicates_src_pass.any?{ |nondup_row| nondup_row.id == src_row.id }
    # end
#    log_row_sizes( Passage, :get_full_name, duplicates_src_pass, nonduplicates_src_pass )
    log_row_sizes( Passage, :get_full_name, pass_collector.duplicate_rows, pass_collector.non_duplicates_rows )

                                                    # ===  GoggleCupStandard (:badge_id)  ===
    src_gcups_ids  = gcup_collector.source_rows.collect{ |row| row.id }
    dest_gcups_ids = gcup_collector.dest_rows.collect{ |row| row.id }
    gcstds_collector = EntityRowDupCollector.new( GoggleCupStandard )
    gcup_filter = ->(gcup_ids) { includes(:goggle_cup).where( goggle_cup_id: gcup_ids ) }

    gcstds_collector.process( src_gcups_ids, gcup_filter, dest_gcups_ids, gcup_filter ) do |src_row, dest_row|
      (dest_row.goggle_cup.year == src_row.goggle_cup.year) &&
      (dest_row.badge_id == src_row.badge_id)
    end
    log_row_sizes( GoggleCupStandard, :get_full_name, gcstds_collector.duplicate_rows, gcstds_collector.non_duplicates_rows )

                                                    # ===  MeetingEntry (Ref.: affiliation, team. badge, swimmer - all W/O FK)  ===
    mentries_collector = EntityRowDupCollector.new( MeetingEntry )
    mentries_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    log_row_sizes( MeetingEntry, :get_verbose_name, mentries_collector.duplicate_rows, mentries_collector.non_duplicates_rows )

                                                    # ===  TeamManager (Ref.: affiliation) ===
    teaman_collector = EntityRowDupCollector.new( TeamManager )
    taff_filter = ->(team_id) { includes(:team_affiliation).where( 'team_affiliations.team_id' => team_id ) }

    teaman_collector.process( slave_team.id, taff_filter, master_team.id, taff_filter ) do |src_row, dest_row|
      (dest_row.team_affiliation_id == src_row.team_affiliation_id) &&
      (dest_row.user_id == src_row.user_id)
    end
    log_row_sizes( TeamManager, :inspect, teaman_collector.duplicate_rows, teaman_collector.non_duplicates_rows )

                                                    # ===  TeamPassageTemplate (Ref.: team) ===
    teampass_collector = EntityRowDupCollector.new( TeamPassageTemplate )
    teampass_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.team_id == src_row.team_id) &&
      (dest_row.event_type_id == src_row.event_type_id) &&
      (dest_row.pool_type_id == src_row.pool_type_id) &&
      (dest_row.passage_type_id == src_row.passage_type_id) &&
      (dest_row.part_order == src_row.part_order) &&
      (dest_row.has_subtotal == src_row.has_subtotal) &&
      (dest_row.has_cycle_count == src_row.has_cycle_count) &&
      (dest_row.has_breath_count == src_row.has_breath_count) &&
      (dest_row.has_non_swam_part == src_row.has_non_swam_part) &&
      (dest_row.has_non_swam_kick_count == src_row.has_non_swam_kick_count) &&
      (dest_row.has_passage_position == src_row.has_passage_position)
    end
    log_row_sizes( TeamPassageTemplate, :inspect, teampass_collector.duplicate_rows, teampass_collector.non_duplicates_rows )

                                                    # ===  ComputedSeasonRanking (Ref.: team) ===
    comprank_collector = EntityRowDupCollector.new( ComputedSeasonRanking )
    comprank_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.team_id == src_row.team_id) &&
      (dest_row.season_id == src_row.season_id) &&
      (dest_row.rank == src_row.rank) &&
      (dest_row.total_points == src_row.total_points)
    end
    log_row_sizes( ComputedSeasonRanking, :get_verbose_name, comprank_collector.duplicate_rows, comprank_collector.non_duplicates_rows )

                                                    # ===  IndividualRecord (Ref.: team) ===
    indivrec_collector = EntityRowDupCollector.new( IndividualRecord )
    indivrec_collector.process( slave_team.id, team_filter, master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.team_id == src_row.team_id) &&
      (dest_row.season_id == src_row.season_id) &&
      (dest_row.federation_type_id == src_row.federation_type_id) &&
      (dest_row.record_type_id == src_row.record_type_id) &&
      (dest_row.pool_type_id == src_row.pool_type_id) &&
      (dest_row.event_type_id == src_row.event_type_id) &&
      (dest_row.category_type_id == src_row.category_type_id) &&
      (dest_row.gender_type_id == src_row.gender_type_id)
    end
    log_row_sizes( IndividualRecord, :inspect, indivrec_collector.duplicate_rows, indivrec_collector.non_duplicates_rows )
    process_text_log << "\r\n"

                                                    # *** UPDATE PHASE starts here ***
    is_ok = execute_update( MeetingIndividualResult, mir_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( MeetingRelaySwimmer, mrs_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( MeetingRelayResult, mrr_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( MeetingTeamScore, mts_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok

    is_ok = execute_update( MeetingEntry, mentries_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( TeamManager, teaman_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( TeamPassageTemplate, teampass_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( ComputedSeasonRanking, comprank_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( IndividualRecord, indivrec_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok

    is_ok = execute_update( Badge, badge_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( DataImportTeamAlias, alias_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( Passage, pass_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( GoggleCupStandard, gcstds_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( GoggleCup, gcup_collector.non_duplicates_rows,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update( TeamAffiliation, nonduplicates_src_taffs,
      master_team.id,
      dup_taff_matrix_ids,
      dup_badge_matrix_ids
    ) if is_ok
                                                    # *** ALIAS CREATION PHASE starts here ***
    if is_ok
      begin                                         # Add an alias for the original team name if missing:
        record = DataImportTeamAlias.create(
          team_id:  master_team.id,
          name:     slave_team.name
        ) if DataImportTeamAlias.where( team_id: master_team.id, name: slave_team.name ).count == 0
        sql_diff_text_log << "\r\n-- Alias creation for master Team:\r\n"
        sql_diff_text_log << to_sql_insert( record, false ) # no additional comment
      rescue
        process_text_log << "\r\n*** Team Merge: exception caught!\r\n"
        process_text_log << "*** Alias creation phase: #{ $!.to_s }\r\n" if $!
        is_ok = false
      end
    end
                                                    # *** DELETE PHASE starts here ***
    is_ok = execute_delete( MeetingIndividualResult,  mir_collector.duplicate_rows ) if is_ok   # Refers: affiliation, badge, team, swimmer
    is_ok = execute_delete( MeetingRelaySwimmer,      mrs_collector.duplicate_rows ) if is_ok       # Refers: relay_result, badge, swimmer
    is_ok = execute_delete( MeetingRelayResult,       mrr_collector.duplicate_rows ) if is_ok        # Refers: affiliation, team
    is_ok = execute_delete( MeetingTeamScore,         mts_collector.duplicate_rows ) if is_ok          # Refers: affiliation, team

    is_ok = execute_delete( MeetingEntry,             mentries_collector.duplicate_rows ) if is_ok          # Refers: affiliation, team. badge, swimmer (all W/O FK)
    is_ok = execute_delete( TeamManager,              teaman_collector.duplicate_rows ) if is_ok             # Refers: affiliation
    is_ok = execute_delete( TeamPassageTemplate,      teampass_collector.duplicate_rows ) if is_ok   # Refers: team
    is_ok = execute_delete( ComputedSeasonRanking,    comprank_collector.duplicate_rows ) if is_ok # Refers: team
    is_ok = execute_delete( IndividualRecord,         indivrec_collector.duplicate_rows ) if is_ok      # Refers: team

    is_ok = execute_delete( Badge,                    badge_collector.duplicate_rows ) if is_ok                 # Refers: affiliation, team, swimmer
    is_ok = execute_delete( DataImportTeamAlias,      alias_collector.duplicate_rows ) if is_ok  # Refers: team
    is_ok = execute_delete( GoggleCupStandard,        gcstds_collector.duplicate_rows ) if is_ok       # Refers: goggle_cup, swimmer
    is_ok = execute_delete( GoggleCup,                gcup_collector.duplicate_rows ) if is_ok                # Refers: team

    is_ok = execute_delete( Passage,                  pass_collector.duplicate_rows ) if is_ok                   # Refers: team, swimmer, indiv.result (no FK)
    is_ok = execute_delete( TeamAffiliation,          duplicates_src_taffs ) if is_ok          # Refers: team

    is_ok = execute_delete( Team, [ slave_team ] ) if is_ok

    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Logs what was found during the collection phase.
  #
  def log_row_sizes( activerecord_class, display_sym, duplicate_rows, nonduplicate_rows,
                     show_also_non_duplicates = false )
    process_text_log << (
      "\r\n- " +
      ("%25s" % "#{activerecord_class.name}:") +
      ("%20s" % "duplicate rows = #{duplicate_rows.size},") +
      ("%30s" % "non-duplicate rows = #{nonduplicate_rows.size}.\r\n")
    )
    if (duplicate_rows.size > 0)
      process_text_log << "    Duplicates:\r\n"
      duplicate_rows.each do |row|
        process_text_log << "    - id:#{row.id}) #{row.send( display_sym )}\r\n"
      end
    end
    if show_also_non_duplicates && (nonduplicate_rows.size > 0)
      process_text_log << "    Non-duplicates:\r\n"
      nonduplicate_rows.each do |row|
        process_text_log << "    - id:#{row.id}) #{row.send( display_sym )}\r\n"
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Executes a single group of update operations for the team-merge process.
  # The updates are performed on a group of "non-duplicate rows" -- that is "rows
  # that can be corrected without yielding duplicates after the update operation".
  #
  # The duplicate team affiliation & duplicate badge matrixes are actually Hash(es)
  # indexed respectively by the team_affiliation_id & badge_id values of the
  # "non-duplicate" row that has to be updated. They serve the purpose of a
  # translating table for source field values into correct destination values for
  # the update operation.
  #
  # Beside updating the team_id link, the team_affiliation & badge ID links from
  # the specified "non duplicate" source rows are updated only if the currently
  # processed row has values that are used as keys inside the two Hash instances.
  #
  # Traps and logs any exception raised. Returns false only in case of errors.
  #
  def execute_update( activerecord_class, nonduplicates_src, dest_team_id,
                      dup_taff_matrix_ids, dup_badge_matrix_ids )
  process_text_log << "Updating #{activerecord_class.name}...\r\n"
    sql_diff_text_log << "\r\n-- Updates for #{activerecord_class.name}:\r\n"
    is_ok = true
    begin
      nonduplicates_src.each do |row|
        sql_attributes = {}
        if row.respond_to?(:team_id)                # Correct the team_id link:
          row.team_id = dest_team_id
          sql_attributes['team_id'] = dest_team_id
        end
                                                    # Correct the affiliation link, when included in the matrix:
        if row.respond_to?(:team_affiliation_id) && dup_taff_matrix_ids.has_key?( row.team_affiliation_id )
          row.team_affiliation_id = dup_taff_matrix_ids[ row.team_affiliation_id ]
          sql_attributes['team_affiliation_id'] = row.team_affiliation_id
        end
                                                    # Correct the badge link, when included in the matrix:
        if row.respond_to?(:badge_id) && dup_badge_matrix_ids.has_key?( row.badge_id )
          row.badge_id = dup_badge_matrix_ids[ row.badge_id ]
          sql_attributes['badge_id'] = row.badge_id
        end
        row.save!
                                                    # Build-up SQL-diff:
        if sql_attributes.size > 0
          con = row.connection
          sets = []
          sql_diff_text_log << "UPDATE #{ con.quote_column_name( row.class.table_name ) } "
          sql_attributes.each do |key, value|
            sets << "#{ con.quote_column_name(key) }=#{ con.quote(value) }"
          end
          sql_diff_text_log << "SET #{ sets.join(', ') } "
          sql_diff_text_log << "WHERE (#{ con.quote_column_name('id') }=#{ row.id });\r\n"
        end
      end
    rescue
      process_text_log << "\r\n*** Team Merge: exception caught!\r\n"
      process_text_log << "*** Phase '#{activerecord_class.name} UPDATE': #{ $!.to_s }\r\n" if $!
      is_ok = false
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Executes a single group of delete operations for the team-merge process
  # Traps and logs any exception raised. Returns false only in case of errors.
  #
  def execute_delete( activerecord_class, duplicates_src )
    process_text_log << "Deleting #{activerecord_class.name} #{duplicates_src.size} duplicates...\r\n"
    sql_diff_text_log << "\r\n-- Deletes for #{activerecord_class.name}:\r\n"
    is_ok = true
    begin
      duplicates_src.each do |row|
        row.destroy
                                                    # Build-up SQL-diff:
        con = row.connection
        sql_diff_text_log << "DELETE FROM #{ con.quote_column_name( row.class.table_name ) } "
        sql_diff_text_log << "WHERE (#{ con.quote_column_name('id') }=#{ row.id });\r\n"
      end
    rescue
      process_text_log << "\r\n*** Team Merge: exception caught!\r\n"
      process_text_log << "*** Phase '#{activerecord_class.name} DELETE': #{ $!.to_s }\r\n" if $!
      is_ok = false
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end
