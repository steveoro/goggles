# encoding: utf-8

require 'data_import/services/data_import_entity_committer'


=begin

= TeamAnalysisResultProcessor

  - Goggles framework vers.:  4.00.585
  - author: Steve A.

 Strategy class delegated to process (check & serialize) a single TeamAnalysisResult
 instance.

 Produces a detailed verbose text log of the analysis as well as a list of
 any SQL actions that that have been carried out during the serialization.

=end
class TeamAnalysisResultProcessor

  attr_reader :logger, :flash, :sql_executable_log, :process_log,
              :committed_rows
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  # When the logger is not given the default is to use the current Rails.logger.
  #
  def initialize( logger = nil, flash = nil )
    @logger = logger || Rails.logger
    @flash  = flash  || {}
    @sql_executable_log = ''                        # SQL diff log
    @process_log        = ''                        # Full process log
    @committed_rows     = []                        # Array of committed rows (currently used only in specs)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Processes an instance of DataImportTeamAnalysisResult.
  # Returns +true+ on success; +false+ otherwise.
  #
  def run( team_analysis_result, is_confirmed, team_alias_override_id )
    raise ArgumentError.new() unless team_analysis_result.instance_of?( DataImportTeamAnalysisResult )
    update_logs(
      "\r\n-------------------------------------------------------------------------------------------------------------" +
      "\r\nProcessing #{is_confirmed ? 'CONFIRMED' : 'unconfirmed'} #{team_analysis_result}..."
    )
    is_ok = true
    team_name = team_analysis_result.searched_team_name
                                                    # Use the alias override, if set:
    if team_alias_override_id
      team_analysis_result.chosen_team_id = team_alias_override_id
      team_analysis_result.rebuild_sql_text()       # (No need to save the instance, since rows will be deleted at the end -- and if something goes wrong, hopefully we still have the log files...)
      update_logs( "Using team_id alias override = #{team_alias_override_id} for '#{team_name}'..." )
    end

    team_id   = team_analysis_result.chosen_team_id
    season_id = team_analysis_result.desired_season_id
                                                    # -- Can ADD new Team? (Default action for unconfirmed team_analysis_results)
    if (! is_confirmed) || team_analysis_result.can_insert_team
      begin
        Team.transaction do                         # Let's make sure other threads have not already done what we want to do:
          if ( Team.where(name: team_name).none? )
            committed_row = Team.new(
              name:             team_name,
              editable_name:    team_name,          # (let's initialize this with the data-import name)
              name_variations:  team_name,
              user_id:          1                   # (don't care)
              # XXX Unable to guess city id (not filled-in, to be added by hand)
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
            @committed_rows << committed_row
            team_id = committed_row.id              # update the team_id with the actual value that shold be used probably also below
          else
            update_logs( "\r\n*** TeamAnalysisResultProcessor: WARNING: skipping Team creation because was (unexpectedly) found already existing! (Name:'#{team_name}')" )
          end
        end
      rescue
        update_logs( "\r\n*** TeamAnalysisResultProcessor: exception caught during Team save! (Name:'#{team_name}')", :error )
        update_logs( "*** #{ $!.to_s }\r\n", :error ) if $!
        @flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        is_ok = false
      end
    end
                                                    # -- Can ADD new Team Alias?
    if ( is_confirmed && team_analysis_result.can_insert_alias )
      raise "DataImportTeamAlias creation: unable to proceed! 'team_id' unexpectedly zero or nil!" if team_id.to_i < 1
      begin
        DataImportTeamAlias.transaction do          # Let's make sure other threads have not already done what we want to do:
          if ( DataImportTeamAlias.where(name: team_name, team_id: team_id).none? )
            committed_row = DataImportTeamAlias.new(
              name:     team_name,
              team_id:  team_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
            @committed_rows << committed_row
          else
            @logger.info( "\r\n*** TeamAnalysisResultProcessor: WARNING: skipping DataImportTeamAlias creation because was (unexpectedly) found already existing! (Name:'#{team_name}', team_id:#{team_id})" ) if @logger
          end
        end
      rescue
        update_logs( "\r\n*** TeamAnalysisResultProcessor: exception caught during DataImportTeamAlias save! (Name:'#{team_name}', team_id:#{team_id})", :error )
        update_logs( "*** #{ $!.to_s }\r\n", :error ) if $!
        @flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        is_ok = false
      end
    end
                                                    # -- Can ADD new TeamAffiliation?
    if ( is_confirmed && team_analysis_result.can_insert_affiliation )
      raise "TeamAffiliation creation: unable to proceed! 'team_id' unexpectedly zero or nil!" if team_id.to_i < 1
      begin
        TeamAffiliation.transaction do              # Let's make sure other threads have not already done what we want to do:
          if ( TeamAffiliation.where(
                  team_id:    team_id,
                  season_id:  season_id
               ).none? )
            committed_row = TeamAffiliation.new(
              name:                       team_name,# Use the actual provided name instead of the result_row.name
              team_id:                    team_id,
              season_id:                  season_id,
              is_autofilled:              true,     # signal that we have guessed some of the values
              must_calculate_goggle_cup:  false,
              user_id:                    1         # (don't care)
              # XXX Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
            @committed_rows << committed_row
          else
            update_logs( "\r\n*** TeamAnalysisResultProcessor: WARNING: skipping TeamAffiliation creation because was (unexpectedly) found already existing! (Name:'#{team_name}', team_id:#{team_id}, season_id:#{season_id})", :error )
          end
        end
      rescue
        update_logs( "\r\n*** TeamAnalysisResultProcessor: exception caught during TeamAffiliation save! (Name:'#{team_name}', team_id:#{team_id}, season_id:#{season_id})", :error )
        update_logs( "*** #{ $!.to_s }\r\n", :error ) if $!
        @flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        is_ok = false
      end
    end
                                                    # Rebuild corrected log files:
    if ( is_confirmed )
      @process_log << team_analysis_result.analysis_log_text
      @sql_executable_log << team_analysis_result.sql_text
    else
      @process_log << "\r\n                    [[[ '#{team_name}' ]]]  -- search overridden:\r\n\r\n   => NOT FOUND.\r\n"
      @sql_executable_log << "INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES\r\n" +
                             "    ('#{team_name}','#{team_name}','','','',1,CURDATE(),CURDATE());\r\n"
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Stores the text +msg+ into the log & logger.
  def update_logs( msg, method = :info )
    @logger.send( method, msg ) if @logger
    @process_log << (msg + "\r\n")
  end
  #-- -------------------------------------------------------------------------
  #++
end
