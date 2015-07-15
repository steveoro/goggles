# encoding: utf-8

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../strategies/sql_converter'
require_relative '../../../strategies/entity_row_dup_collector'


module V2

=begin

= V2::TeamMerger

  - Goggles framework vers.:  4.00.733
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

  # Creates a new instance
  #
  def initialize( slave_team, master_team )
    @slave_team = slave_team
    @master_team = master_team
    @row_collectors = {}
  end
  #-- -------------------------------------------------------------------------
  #++

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
  def process()
    raise ArgumentError.new( "@slave_team must be an instance of Team!" ) unless @slave_team.instance_of?( Team )
    raise ArgumentError.new( "@master_team must be an instance of Team!" ) unless @master_team.instance_of?( Team )
    return true if @slave_team.id == @master_team.id  # Skip process when the teams are the same

    process_text_log << "\r\nMerging '#{@slave_team.name}' (id: #{@slave_team.id}) => '#{@master_team.name}' (id: #{@master_team.id})...\r\n\r\n"
    sql_diff_text_log << "-- Merging '#{@slave_team.name}' (id: #{@slave_team.id}) => '#{@master_team.name}' (id: #{@master_team.id})...\r\n\r\n"

    collect_phase
                                                    # Bail out from any of these, if something goes wrong:
    update_phase && create_alias_phase && delete_phase
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Collect phase.
  # Collects all the linked entity rows for the merge operation while splitting them
  # between "dups" & "non-dups".
  # Returns +false+ on error.
  #
  def collect_phase()
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
                                                    # ===  TeamAffiliation  ===
    collector = EntityRowDupCollector.new( TeamAffiliation )
    team_filter = ->(id) { where( team_id: id ) }

    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.season_id == src_row.season_id)
    end
    # Compose a duplicate-translation hash, with the src TeamAffiliation.id as key
    # and destination TeamAffiliation.id as value:
    @dup_taff_matrix_ids = {}                  # This will allow: src key id |=> dest value id
    collector.duplicate_rows.each do |src_taff_row|
      # ASSERT: there should be only 1 TeamAffiliation for each (team_id, season_id) pair
      dest_taffs_candidate = collector.dest_rows.find do |dest_row|
        src_taff_row.season_id == dest_row.season_id
      end
      @dup_taff_matrix_ids[ src_taff_row.id ] = dest_taffs_candidate.id
    end
    @row_collectors[ TeamAffiliation.table_name ] = collector
    log_row_sizes( TeamAffiliation, :name )

                                                    # ===  Badge  ===
    badge_collector = EntityRowDupCollector.new( Badge )
    badge_collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.swimmer_id == src_row.swimmer_id) &&
      (dest_row.season_id == src_row.season_id)
    end

    @dup_badge_matrix_ids = {}                 # This will allow: src key id |=> dest value id
    badge_collector.duplicate_rows.each do |src_badge_row|
      dest_badge_candidate = badge_collector.dest_rows.find do |dest_row|
        (src_badge_row.swimmer_id == dest_row.swimmer_id) &&
        (src_badge_row.season_id == dest_row.season_id)
      end
      @dup_badge_matrix_ids[ src_badge_row.id ] = dest_badge_candidate.id
    end
    @row_collectors[ Badge.table_name ] = badge_collector
    log_row_sizes( Badge, :get_full_name )

                                                    # ===  DataImportTeamAlias (:team_id)  ===
    collector = EntityRowDupCollector.new( DataImportTeamAlias )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.name == src_row.name)
    end
    @row_collectors[ DataImportTeamAlias.table_name ] = collector
    log_row_sizes( DataImportTeamAlias, :name )

                                                    # ===  GoggleCup (:team_id)  ===
    gcup_collector = EntityRowDupCollector.new( GoggleCup )
    gcup_collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.year == src_row.year)
    end
    @row_collectors[ GoggleCup.table_name ] = gcup_collector
    log_row_sizes( GoggleCup, :year )

    # [Steve, 20131128] The remaining linked entites (MeetingRelaySwimmer, MeetingIndividualResult,
    # MeetingRelayResult, ...) may contain rows that have been added separately from the creation
    # of the source/destination team. Thus, the following entites may have rows that refer to
    # a "duplicate" Team/TeamAffiliation/Badge, but that are indeed new or updatable as well.
    # The only safe way to check this, is to process them one by one, during update, and compare
    # them for possible duplicate after update; if the row will result in a duplicate, it must be
    # deleted.
                                                    # ===  MeetingIndividualResult (:badge_id, :team_id, :team_affiliation_id)  ===
    collector = EntityRowDupCollector.new( MeetingIndividualResult )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    @row_collectors[ MeetingIndividualResult.table_name ] = collector
    log_row_sizes( MeetingIndividualResult, :get_full_name )

                                                    # ===  MeetingRelayResult (:team_id, :team_affiliation_id)  ===
    collector = EntityRowDupCollector.new( MeetingRelayResult )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    @row_collectors[ MeetingRelayResult.table_name ] = collector
    log_row_sizes( MeetingRelayResult, :get_full_name, true ) # log also non-duplicates (these should be few, usually)

                                                    # ===  MeetingTeamScore (:team_id, :team_affiliation_id)  ===
    collector = EntityRowDupCollector.new( MeetingTeamScore )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_id == src_row.meeting_id)
    end
    @row_collectors[ MeetingTeamScore.table_name ] = collector
    log_row_sizes( MeetingTeamScore, :get_full_name )

                                                    # ===  MeetingRelaySwimmer (:badge_id)  ===
    src_badges_ids  = badge_collector.source_rows.collect{ |row| row.id }
    dest_badges_ids = badge_collector.dest_rows.collect{ |row| row.id }
    collector = EntityRowDupCollector.new( MeetingRelaySwimmer )
    badge_filter = ->(badges_ids) { includes(:badge).where( badge_id: badges_ids ) }

    collector.process( src_badges_ids, badge_filter, dest_badges_ids, badge_filter ) do |src_row, dest_row|
      (dest_row.meeting_relay_result_id == src_row.meeting_relay_result_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    @row_collectors[ MeetingRelaySwimmer.table_name ] = collector
    log_row_sizes( MeetingRelaySwimmer, :get_full_name )

                                                    # ===  Passage (:swimmer_id, :team_id)  ===
    collector = EntityRowDupCollector.new( Passage )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    @row_collectors[ Passage.table_name ] = collector
    log_row_sizes( Passage, :get_full_name )

                                                    # ===  GoggleCupStandard (:badge_id)  ===
    src_gcups_ids  = gcup_collector.source_rows.collect{ |row| row.id }
    dest_gcups_ids = gcup_collector.dest_rows.collect{ |row| row.id }
    collector = EntityRowDupCollector.new( GoggleCupStandard )
    gcup_filter = ->(gcup_ids) { includes(:goggle_cup).where( goggle_cup_id: gcup_ids ) }

    collector.process( src_gcups_ids, gcup_filter, dest_gcups_ids, gcup_filter ) do |src_row, dest_row|
      (dest_row.goggle_cup.year == src_row.goggle_cup.year) &&
      (dest_row.badge_id == src_row.badge_id)
    end
    @row_collectors[ GoggleCupStandard.table_name ] = collector
    log_row_sizes( GoggleCupStandard, :get_full_name )

                                                    # ===  MeetingEntry (Ref.: affiliation, team. badge, swimmer - all W/O FK)  ===
    collector = EntityRowDupCollector.new( MeetingEntry )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.meeting_program_id == src_row.meeting_program_id) &&
      (dest_row.swimmer_id == src_row.swimmer_id)
    end
    @row_collectors[ MeetingEntry.table_name ] = collector
    log_row_sizes( MeetingEntry, :get_verbose_name )

                                                    # ===  TeamManager (Ref.: affiliation) ===
    collector = EntityRowDupCollector.new( TeamManager )
    taff_filter = ->(team_id) { includes(:team_affiliation).where( 'team_affiliations.team_id' => team_id ) }

    collector.process( @slave_team.id, taff_filter, @master_team.id, taff_filter ) do |src_row, dest_row|
      (dest_row.team_affiliation_id == src_row.team_affiliation_id) &&
      (dest_row.user_id == src_row.user_id)
    end
    @row_collectors[ TeamManager.table_name ] = collector
    log_row_sizes( TeamManager, :inspect )

                                                    # ===  TeamPassageTemplate (Ref.: team) ===
    collector = EntityRowDupCollector.new( TeamPassageTemplate )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
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
    @row_collectors[ TeamPassageTemplate.table_name ] = collector
    log_row_sizes( TeamPassageTemplate, :inspect )

                                                    # ===  ComputedSeasonRanking (Ref.: team) ===
    collector = EntityRowDupCollector.new( ComputedSeasonRanking )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.team_id == src_row.team_id) &&
      (dest_row.season_id == src_row.season_id) &&
      (dest_row.rank == src_row.rank) &&
      (dest_row.total_points == src_row.total_points)
    end
    @row_collectors[ ComputedSeasonRanking.table_name ] = collector
    log_row_sizes( ComputedSeasonRanking, :get_verbose_name )

                                                    # ===  IndividualRecord (Ref.: team) ===
    collector = EntityRowDupCollector.new( IndividualRecord )
    collector.process( @slave_team.id, team_filter, @master_team.id, team_filter ) do |src_row, dest_row|
      (dest_row.team_id == src_row.team_id) &&
      (dest_row.season_id == src_row.season_id) &&
      (dest_row.federation_type_id == src_row.federation_type_id) &&
      (dest_row.record_type_id == src_row.record_type_id) &&
      (dest_row.pool_type_id == src_row.pool_type_id) &&
      (dest_row.event_type_id == src_row.event_type_id) &&
      (dest_row.category_type_id == src_row.category_type_id) &&
      (dest_row.gender_type_id == src_row.gender_type_id)
    end
    @row_collectors[ IndividualRecord.table_name ] = collector
    log_row_sizes( IndividualRecord, :inspect )
    process_text_log << "\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Update phase.
  # Updates all the non-duplicate entity rows collected during the collection phase..
  # Returns +false+ on error.
  #
  def update_phase()
    execute_update( MeetingIndividualResult ) &&
    execute_update( MeetingRelaySwimmer ) &&
    execute_update( MeetingRelayResult ) &&
    execute_update( MeetingTeamScore ) &&

    execute_update( MeetingEntry ) &&
    execute_update( TeamManager ) &&
    execute_update( TeamPassageTemplate ) &&
    execute_update( ComputedSeasonRanking ) &&
    execute_update( IndividualRecord ) &&

    execute_update( Badge ) &&
    execute_update( DataImportTeamAlias ) &&
    execute_update( Passage ) &&
    execute_update( GoggleCupStandard ) &&
    execute_update( GoggleCup ) &&
    execute_update( TeamAffiliation )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Alias-creation phase.
  # Creates an data-import team alias using the slave Team name as an alias for the
  # master team name, but only if missing from the alias list.
  # Returns +false+ on error.
  #
  def create_alias_phase()
    is_ok = true
    begin
      record = DataImportTeamAlias.create(
        team_id:  @master_team.id,
        name:     @slave_team.name
      ) if DataImportTeamAlias.where( team_id: @master_team.id, name: @slave_team.name ).count == 0
      sql_diff_text_log << "\r\n-- Alias creation for master Team:\r\n"
      sql_diff_text_log << to_sql_insert( record, false ) # no additional comment
    rescue
      process_text_log << "\r\n*** Team Merge: exception caught!\r\n"
      process_text_log << "*** Alias creation phase: #{ $!.to_s }\r\n" if $!
      is_ok = false
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Delete phase.
  # Deletes all the duplicate entity rows collected during the collection phase..
  # Returns +false+ on error.
  #
  def delete_phase()
    execute_delete( MeetingIndividualResult ) &&    # Refers: affiliation, badge, team, swimmer
    execute_delete( MeetingRelaySwimmer ) &&        # Refers: relay_result, badge, swimmer
    execute_delete( MeetingRelayResult ) &&         # Refers: affiliation, team
    execute_delete( MeetingTeamScore ) &&           # Refers: affiliation, team

    execute_delete( MeetingEntry ) &&               # Refers: affiliation, team. badge, swimmer (all W/O FK)
    execute_delete( TeamManager ) &&                # Refers: affiliation
    execute_delete( TeamPassageTemplate ) &&        # Refers: team
    execute_delete( ComputedSeasonRanking ) &&      # Refers: team
    execute_delete( IndividualRecord ) &&           # Refers: team

    execute_delete( Badge ) &&                      # Refers: affiliation, team, swimmer
    execute_delete( DataImportTeamAlias ) &&        # Refers: team
    execute_delete( GoggleCupStandard ) &&          # Refers: goggle_cup, swimmer
    execute_delete( GoggleCup ) &&                  # Refers: team
    execute_delete( Passage) &&                     # Refers: team, swimmer, indiv.result (no FK)
    execute_delete( TeamAffiliation ) &&            # Refers: team

    execute_delete( Team )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Logs what was found during the collection phase.
  #
  def log_row_sizes( activerecord_class, display_sym, show_also_non_duplicates = false )
    collector = @row_collectors[ activerecord_class.table_name ]
    process_text_log << (
      "\r\n- " +
      ("%25s" % "#{activerecord_class.name}:") +
      ("%20s" % "duplicate rows = #{collector.duplicate_rows.size},") +
      ("%30s" % "non-duplicate rows = #{collector.non_duplicates_rows.size}.\r\n")
    )
    if collector.duplicate_rows.size > 0
      process_text_log << "    Duplicates:\r\n"
      collector.duplicate_rows.each do |row|
        process_text_log << "    - id:#{row.id}) #{row.send( display_sym )}\r\n"
      end
    end
    if show_also_non_duplicates && (collector.non_duplicates_rows.size > 0)
      process_text_log << "    Non-duplicates:\r\n"
      collector.non_duplicates_rows.each do |row|
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
  def execute_update( activerecord_class )
    collector = @row_collectors[ activerecord_class.table_name ]
    process_text_log << "Updating #{activerecord_class.name}...\r\n"
    sql_diff_text_log << "\r\n-- Updates for #{activerecord_class.name}:\r\n"
    is_ok = true
    begin
      collector.non_duplicates_rows.each do |row|
        sql_attributes = {}
        if row.respond_to?(:team_id)                # Correct the team_id link:
          row.team_id = @master_team.id
          sql_attributes['team_id'] = @master_team.id
        end
                                                    # Correct the affiliation link, when included in the matrix:
        if row.respond_to?(:team_affiliation_id) && @dup_taff_matrix_ids.has_key?( row.team_affiliation_id )
          row.team_affiliation_id = @dup_taff_matrix_ids[ row.team_affiliation_id ]
          sql_attributes['team_affiliation_id'] = row.team_affiliation_id
        end
                                                    # Correct the badge link, when included in the matrix:
        if row.respond_to?(:badge_id) && @dup_badge_matrix_ids.has_key?( row.badge_id )
          row.badge_id = @dup_badge_matrix_ids[ row.badge_id ]
          sql_attributes['badge_id'] = row.badge_id
        end
        row.save!
                                                    # Build-up SQL-diff:
        if sql_attributes.size > 0                  # (false = no additional comment)
          sql_diff_text_log << to_sql_update( row, false, sql_attributes, "\r\n" )
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
  def execute_delete( activerecord_class )
    collector = @row_collectors[ activerecord_class.table_name ]
    # ASSERT: the only case in which we don't have a collector defined for the specified class
    #         should be for the deletion against Team:
    dup_rows = collector ? collector.duplicate_rows : [ @slave_team ]

    process_text_log << "Deleting #{activerecord_class.name} #{dup_rows.size} duplicates...\r\n"
    sql_diff_text_log << "\r\n-- Deletes for #{activerecord_class.name}:\r\n"
    is_ok = true
    begin
      dup_rows.each do |row|
        row.destroy                                 # Build-up SQL-diff:
        sql_diff_text_log << to_sql_delete( row, false ) # no additional comment
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
end