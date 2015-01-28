# encoding: utf-8


=begin

= TeamMerger

  - Goggles framework vers.:  4.00.727
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

                                                    # ===  TeamAffiliation  ===
    dest_taffs = TeamAffiliation.where( team_id: master_team.id )
    dest_season_ids = dest_taffs.collect{ |row| row.season_id }
                                                    # Separate duplicates from new (updatable) rows:
    duplicates_src_taffs = TeamAffiliation.where( team_id: slave_team.id, season_id: dest_season_ids )
    duplicates_src_taffs_ids = duplicates_src_taffs.collect{ |row| row.id }

    src_taffs = TeamAffiliation.where( team_id: slave_team.id )
    src_taffs_ids = src_taffs.collect { |row| row.id }

    nonduplicates_src_taffs_ids = src_taffs_ids.reject { |id| duplicates_src_taffs_ids.member?(id) }
    nonduplicates_src_taffs = src_taffs.reject { |row| duplicates_src_taffs_ids.member?(row.id) }
    # Compose a duplicate-translation hash, with the src TeamAffiliation.id as key
    # and destination TeamAffiliation.id as value:
    duplicate_taff_matrix_ids = {}                  # This will allow: src key id |=> dest value id
    duplicates_src_taffs.each do |src_taff_row|
      # ASSERT: there's only 1 TeamAffiliation for each (team_id, season_id) pair
      dest_taffs_candidate = dest_taffs.find{ |r| src_taff_row.season_id == r.season_id }
      duplicate_taff_matrix_ids[ src_taff_row.id ] = dest_taffs_candidate.id
    end
    log_row_sizes( TeamAffiliation, :name, duplicates_src_taffs, nonduplicates_src_taffs )

                                                    # ===  Badge  ===
    src_badges  = Badge.where( team_id: slave_team.id )
    dest_badges = Badge.where( team_id: master_team.id )
                                                    # Separate future non-duplicate, updatable rows from the duplicate ones:
    nonduplicates_src_badges = src_badges.reject do |src_row|
      # Reject all badges that have same swimmer and season from the source list
      # to obtain non-duplicate badges:
      dest_badges.any? do |dest_row|
        (dest_row.swimmer_id == src_row.swimmer_id) &&
        (dest_row.season_id == src_row.season_id)
      end
    end
    duplicates_src_badges = src_badges.reject do |src_row|
      # Obtain duplicate badges by removing the non-duplicates from the source list:
      nonduplicates_src_badges.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    nonduplicates_src_badges_ids = nonduplicates_src_badges.collect{ |row| row.id }
    duplicates_src_badges_ids    = duplicates_src_badges.collect{ |row| row.id }

    src_badges_ids  = src_badges.collect{ |row| row.id }
    dest_badges_ids = dest_badges.collect{ |row| row.id }

    duplicate_badge_matrix_ids = {}                 # This will allow: src key id |=> dest value id
    duplicates_src_badges.each do |src_badge_row|
      dest_badge_candidate = dest_badges.find do |r|
        (src_badge_row.swimmer_id == r.swimmer_id) &&
        (src_badge_row.season_id == r.season_id)
      end
      duplicate_badge_matrix_ids[ src_badge_row.id ] = dest_badge_candidate.id
    end
    log_row_sizes( Badge, :get_full_name, duplicates_src_badges, nonduplicates_src_badges )

                                                    # ===  Swimmers  ===
    src_swimmers_ids  = src_badges.collect{ |row| row.swimmer_id }
    dest_swimmers_ids = dest_badges.collect{ |row| row.swimmer_id }

                                                    # ===  DataImportTeamAlias (:team_id)  ===
    src_di_tals  = DataImportTeamAlias.where( team_id: slave_team.id )
    dest_di_tals = DataImportTeamAlias.where( team_id: master_team.id )
    nonduplicates_src_di_tals = src_di_tals.reject do |src_row|
      # Reject all source aliases that have the same name as a destination alias
      # (thus are duplicates because they would refer to the same IDs after the
      #  update phase):
      dest_di_tals.any?{ |dest_row| dest_row.name == src_row.name }
    end
    duplicates_src_di_tals = src_di_tals.reject do |src_row|
      # Removing all non-duplicate aliases from the source list will yield the
      # list of duplicate alieses to be deleted:
      nonduplicates_src_di_tals.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( DataImportTeamAlias, :name, duplicates_src_di_tals, nonduplicates_src_di_tals )

                                                    # ===  GoggleCup (:team_id)  ===
    src_gcups  = GoggleCup.where( team_id: slave_team.id )
    dest_gcups = GoggleCup.where( team_id: master_team.id )

    nonduplicates_src_gcups = src_gcups.reject do |src_row|
      dest_gcups.any?{ |dest_row| dest_row.year == src_row.year }
    end
    duplicates_src_gcups = src_gcups.reject do |src_row|
      nonduplicates_src_gcups.any?{ |nondup_row| nondup_row.id == src_row.id }
    end

    nonduplicates_src_gcup_ids = nonduplicates_src_gcups.collect{ |row| row.id }
    duplicates_src_gcup_ids    = duplicates_src_gcups.collect{ |row| row.id }

    src_gcups_ids  = src_gcups.collect{ |row| row.id }
    dest_gcups_ids = dest_gcups.collect{ |row| row.id }
    log_row_sizes( GoggleCup, :year, duplicates_src_gcups, nonduplicates_src_gcups )

    # [Steve, 20131128] The remaining linked entites (MeetingRelaySwimmer, MeetingIndividualResult,
    # MeetingRelayResult, ...) may contain rows that have been added separately from the creation
    # of the source/destination team. Thus, the following entites may have rows that refer to
    # a "duplicate" Team/TeamAffiliation/Badge, but that are indeed new or updatable as well.
    # The only safe way to check this, is to process them one by one, during update, and compare
    # them for possible duplicate after update; if the row will result in a duplicate, it must be
    # deleted.
                                                    # ===  MeetingIndividualResult (:badge_id, :team_id, :team_affiliation_id)  ===
    src_mirs  = MeetingIndividualResult.where( team_id: slave_team.id )
    dest_mirs = MeetingIndividualResult.where( team_id: master_team.id )

    nonduplicates_src_mirs = src_mirs.reject do |src_row|
      dest_mirs.any? do |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id) &&
        (dest_row.swimmer_id == src_row.swimmer_id)
      end
    end
    duplicates_src_mirs = src_mirs.reject do |src_row|
      nonduplicates_src_mirs.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( MeetingIndividualResult, :get_full_name, duplicates_src_mirs, nonduplicates_src_mirs )

                                                    # ===  MeetingRelayResult (:team_id, :team_affiliation_id)  ===
    src_mrrs  = MeetingRelayResult.where( team_id: slave_team.id )
    dest_mrrs = MeetingRelayResult.where( team_id: master_team.id )

    nonduplicates_src_mrrs = src_mrrs.reject do |src_row|
      dest_mrrs.any? do |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id)
      end
    end
    duplicates_src_mrrs = src_mrrs.reject do |src_row|
      nonduplicates_src_mirs.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( MeetingRelayResult, :get_full_name, duplicates_src_mrrs, nonduplicates_src_mrrs )

                                                    # ===  MeetingTeamScore (:team_id, :team_affiliation_id)  ===
    src_mtss  = MeetingTeamScore.where( team_id: slave_team.id )
    dest_mtss = MeetingTeamScore.where( team_id: master_team.id )
    nonduplicates_src_mtss = src_mtss.reject do |src_row|
      dest_mtss.any? do |dest_row|
        (dest_row.meeting_id == src_row.meeting_id)
      end
    end
    duplicates_src_mtss = src_mtss.reject do |src_row|
      nonduplicates_src_mtss.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( MeetingTeamScore, :get_full_name, duplicates_src_mtss, nonduplicates_src_mtss )

                                                    # ===  MeetingRelaySwimmer (:badge_id)  ===
    src_mrss  = MeetingRelaySwimmer.includes(:badge).where( badge_id: src_badges_ids )
    dest_mrss = MeetingRelaySwimmer.includes(:badge).where( badge_id: dest_badges_ids )

    nonduplicates_src_mrss = src_mrss.reject do |src_row|
      dest_mrss.any? do |dest_row|
        (dest_row.meeting_relay_result_id == src_row.meeting_relay_result_id) &&
        (dest_row.swimmer_id == src_row.swimmer_id)
      end
    end
    duplicates_src_mrss = src_mrss.reject do |src_row|
      nonduplicates_src_mrss.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( MeetingRelaySwimmer, :get_full_name, duplicates_src_mrss, nonduplicates_src_mrss )

                                                    # ===  Passage (:swimmer_id, :team_id)  ===
    src_pass  = Passage.where( team_id: slave_team.id, swimmer_id: src_swimmers_ids )
    dest_pass = Passage.where( team_id: master_team.id, swimmer_id: dest_swimmers_ids )

    nonduplicates_src_pass = src_pass.reject do |src_row|
      dest_pass.any? do |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id) &&
        (dest_row.swimmer_id == src_row.swimmer_id)
      end
    end
    duplicates_src_pass = src_pass.reject do |src_row|
      nonduplicates_src_pass.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( Passage, :get_full_name, duplicates_src_pass, nonduplicates_src_pass )

                                                    # ===  GoggleCupStandard (:badge_id)  ===
    src_gcstds  = GoggleCupStandard.includes(:goggle_cup).where( goggle_cup_id: src_gcups_ids )
    dest_gcstds = GoggleCupStandard.includes(:goggle_cup).where( goggle_cup_id: dest_gcups_ids )

    nonduplicates_src_gcstds = src_gcstds.reject do |src_row|
      dest_gcstds.any? do |dest_row|
        (dest_row.goggle_cup.year == src_row.goggle_cup.year) &&
        (dest_row.badge_id == src_row.badge_id)
      end
    end
    duplicates_src_gcstds = src_gcstds.reject do |src_row|
      nonduplicates_src_gcstds.any?{ |nondup_row| nondup_row.id == src_row.id }
    end
    log_row_sizes( GoggleCupStandard, :get_full_name, duplicates_src_gcstds, nonduplicates_src_gcstds )
    process_text_log << "\r\n"

                                                    # *** UPDATE PHASE starts here ***
    is_ok = execute_update_operation( Badge, nonduplicates_src_badges,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( DataImportTeamAlias, nonduplicates_src_di_tals,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( MeetingTeamScore, nonduplicates_src_mtss,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( MeetingRelayResult, nonduplicates_src_mrrs,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( MeetingRelaySwimmer, nonduplicates_src_mrss,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( MeetingIndividualResult, nonduplicates_src_mirs,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( Passage, nonduplicates_src_pass,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( GoggleCup, nonduplicates_src_gcups,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( GoggleCupStandard, nonduplicates_src_gcstds,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
    is_ok = execute_update_operation( TeamAffiliation, nonduplicates_src_taffs,
      master_team.id, duplicate_taff_matrix_ids,
      duplicate_badge_matrix_ids
    ) if is_ok
                                                    # *** DELETE PHASE starts here ***
    is_ok = execute_delete_operation( TeamAffiliation, duplicates_src_taffs ) if is_ok
    is_ok = execute_delete_operation( Badge, duplicates_src_badges ) if is_ok
    is_ok = execute_delete_operation( DataImportTeamAlias, duplicates_src_di_tals ) if is_ok
    is_ok = execute_delete_operation( GoggleCup, duplicates_src_gcups ) if is_ok
    is_ok = execute_delete_operation( MeetingIndividualResult, duplicates_src_mirs ) if is_ok
    is_ok = execute_delete_operation( MeetingRelayResult, duplicates_src_mrrs ) if is_ok
    is_ok = execute_delete_operation( MeetingTeamScore, duplicates_src_mtss ) if is_ok
    is_ok = execute_delete_operation( MeetingRelaySwimmer, duplicates_src_mrss ) if is_ok
    is_ok = execute_delete_operation( Passage, duplicates_src_pass ) if is_ok
    is_ok = execute_delete_operation( GoggleCupStandard, duplicates_src_gcstds ) if is_ok
                                                    # Final act: create alias if missing + original source Team destroy:
    if is_ok
      begin                                         # Add an alias for the original team name if missing:
        if DataImportTeamAlias.where( team_id: master_team.id, name: slave_team.name ).count == 0
          DataImportTeamAlias.create( team_id: master_team.id, name: slave_team.name )
        end
        slave_team.destroy
        con = slave_team.connection
        sql_diff_text_log << "\r\n-- Final delete for Team (merged/slave team only):\r\n"
        sql_diff_text_log << "DELETE FROM #{ con.quote_column_name( slave_team.class.table_name ) } "
        sql_diff_text_log << "WHERE (#{ con.quote_column_name('id') }=#{ slave_team.id });\r\n"
      rescue
        process_text_log << "\r\n*** Team Merge: exception caught!\r\n"
        process_text_log << "*** Final phase 'SOURCE Team DELETE': #{ $!.to_s }\r\n" if $!
        is_ok = false
      end
    end

    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Logs what was found during the collection phase.
  #
  def log_row_sizes( activerecord_class, display_sym, duplicate_rows, nonduplicate_rows )
    process_text_log << (
      "- " +
      ("%25s" % "#{activerecord_class.name}:") +
      ("%20s" % "duplicate rows = #{duplicate_rows.size},") +
      ("%30s" % "non-duplicate rows = #{nonduplicate_rows.size}.\r\n")
    )
    if (duplicate_rows.size > 0)
      duplicate_rows.each do |row|
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
  # "non-duplicate" row that has to be updated.
  #
  # Beside updating the team_id link, the team_affiliation & badge ID links from
  # the specified "non duplicate" source rows are updated only if the currently
  # processed row has values that are used as keys inside the two Hash instances.
  #
  # Traps and logs any exception raised. Returns false only in case of errors.
  #
  def execute_update_operation( activerecord_class, nonduplicates_src,
                                dest_team_id, duplicate_taff_matrix_ids,
                                duplicate_badge_matrix_ids )
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
        if row.respond_to?(:team_affiliation_id) && duplicate_taff_matrix_ids.has_key?( row.team_affiliation_id )
          row.team_affiliation_id = duplicate_taff_matrix_ids[ row.team_affiliation_id ]
          sql_attributes['team_affiliation_id'] = row.team_affiliation_id
        end
                                                    # Correct the badge link, when included in the matrix:
        if row.respond_to?(:badge_id) && duplicate_badge_matrix_ids.has_key?( row.badge_id )
          row.badge_id = duplicate_badge_matrix_ids[ row.badge_id ]
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
  def execute_delete_operation( activerecord_class, duplicates_src )
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
