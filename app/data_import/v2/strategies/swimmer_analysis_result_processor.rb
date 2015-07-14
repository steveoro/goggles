# encoding: utf-8

require_relative '../../../data_import/v2/services/data_import_entity_committer'
require_relative '../../../strategies/sql_converter'


=begin

= V2::SwimmerAnalysisResultProcessor

  - Goggles framework vers.:  4.00.719
  - author: Steve A.

 Strategy class delegated to process (check & serialize) a single DataImportSwimmerAnalysisResult
 instance.

 Produces a detailed verbose text log of the analysis as well as a list of
 any SQL actions that that have been carried out during the serialization.

=end
class V2::SwimmerAnalysisResultProcessor
  include SqlConverter

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


  # Processes an instance of DataImportSwimmerAnalysisResult.
  # Returns +true+ on success; +false+ otherwise.
  #
  def run( swimmer_analysis_result, is_confirmed, swimmer_alias_override_id )
    raise ArgumentError.new() unless swimmer_analysis_result.instance_of?( DataImportSwimmerAnalysisResult )
    update_logs(
      "\r\n-------------------------------------------------------------------------------------------------------------\r\n" <<
      "\r\nProcessing #{is_confirmed ? 'CONFIRMED' : 'unconfirmed'} #{swimmer_analysis_result}..."
    )
    is_ok = true
    swimmer_name = swimmer_analysis_result.searched_swimmer_name
                                                    # Use the alias override, if set:
    if swimmer_alias_override_id.to_i > 0
      swimmer_analysis_result.chosen_swimmer_id = swimmer_alias_override_id
      # Make sure a SwimmerAffiliation will be skipped for this phase of the analysis
      # (since there is a swimmer ID override, the SwimmerAffiliation may be already existing):
      swimmer_analysis_result.best_match_name = ''
      swimmer_analysis_result.rebuild_sql_text()       # (No need to save the instance, since rows will be deleted at the end -- and if something goes wrong, hopefully we still have the log files...)
      update_logs( "Using swimmer_id alias override = #{swimmer_alias_override_id} for '#{swimmer_name}'..." )
    end

    # NOTE: swimmer_id will always refer to an instance of Swimmer, not DataImportSwimmer!
    #       (Thus, if it is not zero and a linked SwimmerAffiliation is missing, we'll know
    #        that we can create one.)
    swimmer_id     = swimmer_analysis_result.chosen_swimmer_id
    year_of_birth  = swimmer_analysis_result.desired_year_of_birth
    gender_type_id = swimmer_analysis_result.desired_gender_type_id
    @sql_executable_log << "\r\n-- Processing:...'#{swimmer_name}' (#{year_of_birth}, gender: #{gender_type_id})\r\n"
    gender_type    = GenderType.find( gender_type_id )
                                                    # -- Can ADD new Swimmer? (Default action for unconfirmed swimmer_analysis_results)
    if (! is_confirmed) || swimmer_analysis_result.can_insert_swimmer
      begin
        swimmer_builder = V2::DataImportSwimmerBuilder.build_from_parameters(
          swimmer_analysis_result.data_import_session,
          swimmer_name,
          # [Steve] If we have a range of years, signal to the builder that the
          # birth year must be (re-)guessed from the category type:
          swimmer_analysis_result.max_year_of_birth? ? nil : year_of_birth,
          gender_type,
          swimmer_analysis_result.category_type,
          true # During this phase, we have to force_team_or_swimmer_creation
        )
        committed_row = swimmer_builder.result_row
        update_logs( "Created new #{committed_row.class}, ID: #{committed_row.id}." ) if committed_row
        # Make sure a SwimmerAffiliation will be skipped for this phase of the
        # analysis (we need to make sure that only actual Swimmers will be used
        # not secondary/temporary entities):
        swimmer_id = nil if committed_row.instance_of?( DataImportSwimmer )
      rescue
        update_logs( "\r\n*** V2::SwimmerAnalysisResultProcessor: exception caught during DataImportSwimmer building! (Name:'#{swimmer_name}')", :error )
        update_logs( "*** #{ $!.to_s }\r\n", :error ) if $!
        @flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        is_ok = false
      end
    end
                                                    # -- Can ADD new Swimmer Alias?
    if ( is_ok && swimmer_id.to_i > 0 && is_confirmed && swimmer_analysis_result.can_insert_alias )
      begin
        DataImportSwimmerAlias.transaction do          # Let's make sure other threads have not already done what we want to do:
          if ( DataImportSwimmerAlias.where(complete_name: swimmer_name, swimmer_id: swimmer_id).none? )
            committed_row = DataImportSwimmerAlias.new(
              complete_name:  swimmer_name,
              swimmer_id:     swimmer_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
            @committed_rows << committed_row
            swimmer_alias = Swimmer.find_by_id( swimmer_id )
            @sql_executable_log << "-- aliased with: '#{swimmer_alias.complete_name}' (ID:#{swimmer_alias.id})\r\n" if swimmer_alias
            @sql_executable_log << to_sql_insert( committed_row, false ) # (No user comment)
          else
            @logger.info( "\r\n*** V2::SwimmerAnalysisResultProcessor: WARNING: skipping DataImportSwimmerAlias creation because was (unexpectedly) found already existing! (Name:'#{swimmer_name}', swimmer_id:#{swimmer_id})" ) if @logger
          end
        end
      rescue
        update_logs( "\r\n*** V2::SwimmerAnalysisResultProcessor: exception caught during DataImportSwimmerAlias save! (Name:'#{swimmer_name}', swimmer_id:#{swimmer_id})", :error )
        update_logs( "*** #{ $!.to_s }\r\n", :error ) if $!
        @flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        is_ok = false
      end
    end
                                                    # Rebuild corrected log files:
    if ( is_confirmed )
      @process_log << swimmer_analysis_result.analysis_log_text
    else
      @process_log << "\r\n                    [[[ '#{swimmer_name}' ]]]  -- search overridden:\r\n\r\n   => NOT FOUND.\r\n"
    end
    @process_log << "\r\n----8<---- (Original suggested statements:) ----" << swimmer_analysis_result.sql_text
    @process_log << "----8<----\r\n"
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

