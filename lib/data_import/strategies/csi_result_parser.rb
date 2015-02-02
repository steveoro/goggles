# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'common/encoding_tools'
require 'data_import/csi_result_dao'
require 'data_import/header_fields_dao'
require 'data_import/strategies/season_detect_utils'
require 'data_import/services/data_import_team_builder'
require 'data_import/services/data_import_swimmer_builder'

require_relative '../../../app/strategies/sql_converter'
                                                    # The following applies only to Ruby <= 1.9.2
require 'iconv' unless String.method_defined?( :encode )


=begin

= CsiResultParser

  - Goggles framework vers.:  4.00.735
  - author: Steve A.

 Strategy class delegated to parse result or entry datafiles for CSI Meetings.

 The datafiles are in CSV format, separated by ';'. Structure is quite fixed and
 the fields are almost always the same.

 For each CSV row a single CsiResultDao is produced. Each DAO is the parsed into
 database entities, where possible.

=end
class CsiResultParser
  include SeasonDetectUtils

  # These must be initialized on creation:
  attr_reader :full_pathname, :dao_list
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( full_pathname )
    @full_pathname = full_pathname
    tot_rows = 0
    process_text_log << "Datafile: #{full_pathname}\r\n"
    @dao_list = []
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line do |curr_line|
        if tot_rows > 0                             # Skip header at line #0
          # Make sure each line has a valid UTF-8 sequence of characters:
          curr_line = EncodingTools.force_valid_encoding( curr_line )
          complete_name, year_of_birth, team_name, result_timing, entry_timing,
          rank, badge_code, total_events, category_code, combined_key,
          entry_order = curr_line.split(';')
                                                    # Fill the list of DAOs with current line values:
          @dao_list << CsiResultDAO.new(
            complete_name, year_of_birth, team_name, result_timing, entry_timing,
            rank, badge_code, total_events, category_code, combined_key,
            entry_order
          )
        end
        tot_rows = tot_rows + 1
      end
    end

    process_text_log << "Acquired #{tot_rows} data rows.\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the overall text log for all the operations performed with this instance.
  # It is never +nil+, empty at first.
  #
  def process_text_log
    @process_text_log ||= "\t*****************************\r\n\t   CSI Result parsing:\r\n\t*****************************\r\n"
  end

  # Returns the overall SQL diff/log for all the SQL operations that should
  # be carried out by for replicating the changes (already done by this instance) on
  # another instance of the same Database (for example, to apply the changes on
  # a production DB after testing them on a staging version of the same DB).
  # It is never +nil+, empty at first.
  #
  def sql_diff_text_log
    @sql_diff_text_log ||= "-- ** CSI Result parsing: #{@full_pathname} **"
  end
  # ----------------------------------------------------------------------------
  #++


  # Parses the acquired list of DAOs into importable entities.
  def parse()
    setup_data_import_session
    is_ok = prescan_dao_list_for_unknown_team_names && prescan_dao_list_for_unknown_swimmer_names
    if is_ok
      # TODO proceed with serialize
    end
    # TODO phase_1_2_serialize

    # TODO invoke phase_3_0_commit separately, either from rake task or controller action
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Creates a new data-import session returning its instance.
  #
  def create_new_data_import_session( season_id = nil, current_admin_id = 1 )
    DataImportSession.create(
      phase:            0,
      file_format:      'ris-csi',
      file_name:        @full_pathname,
      source_data:      @dao_list.join("\r\n"),
      total_data_rows:  @dao_list.size,
      season_id:        season_id,
      phase_1_log:      process_text_log,
      phase_2_log:      '',
      phase_3_log:      '1.0-PARSE',
      sql_diff:         '',                         # Actual SQL-diff resulting from the whole data-import procedure
      user_id:          current_admin_id
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Set-up for @data_import_session. Should return an instance of DataImportSession.
  # +nil+ only on error.
  def setup_data_import_session
    @header_fields_dao = FilenameParser.new( @full_pathname ).parse()

    if @season.nil?                                 # SEASON DETECT
      try_detect_season_from_file_path
      try_detect_season_from_header_fields
                                                    # (@season must be defined after this point)
      process_text_log << "#{I18n.t(:season_not_found, { scope: [:admin_import] })}\r\n#{ @header_fields_dao.inspect }\r\n" and return nil unless @season
    else
      process_text_log << "Specified season ID=#{@season.id}. Parsing file...\r\n"
    end
                                                    # Get the remaining default values from the season instance:
    @header_fields_dao.header_year     = @season.header_year # override header_year and use for safety the one from the season
    @header_fields_dao.edition         = @season.edition
    @header_fields_dao.edition_type_id = @season.edition_type_id
    @header_fields_dao.timing_type_id  = @season.timing_type_id
    process_text_log << "Parsed header_fields_dao: #{@header_fields_dao.inspect}\r\n\r\n"
############################################################
    # TODO ADD here setup for @meeting also => we will assume Season, Meeting & MeetingSession as ALREADY EXISTING

############################################################
    @data_import_session = create_new_data_import_session( @season.id )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Scans internal @dao_list structure to collect all team names found.
  #
  # For each team name found, a DataImportTeamBuilder instance is executed.
  # If the Team is not found or some problem arises, that same class will delegate to
  # a strategy class to perform the team name analysis (which will then require human
  #`supervision before commit).
  #
  # == Returns: when +false+, the additional "Team name analysis" phase must be
  #    executed; +true+ if the "standard" data-import phase can go on.
  #
  def prescan_dao_list_for_unknown_team_names
    is_ok = true
    unique_names = @dao_list.map{ |dao| dao.team_name }.uniq.sort
    process_text_log << "\r\n** Final collected UNIQUE Team names: **\r\n\r\n" <<
                        unique_names.join("\r\n") << "\r\n==== Tot.: #{ unique_names.size } ====\r\n"

    unique_names.each_with_index do |team_name, idx|
      team_builder = DataImportTeamBuilder.build_from_parameters(
        @data_import_session,
        team_name,
        @season,
        false # force_team_or_swimmer_creation
      )
      team = team_builder.result_row
      unless team
        process_text_log << "Prescan Team names: '#{ team_name }' (#{ idx+1 }/#{ unique_names.size }) uncertain. 'Team name Analysis' needed.\r\n"
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: @data_import_session.id ).update_all(
        phase_3_log: "1-TEAM-CHECK:#{ idx+1 }/#{ unique_names.size }"
      )
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Scans the internal @dao_list structure to collect all swimmer names found.
  #
  # For each swimmer name found, a DataImportSwimmerBuilder instance is executed.
  # If the Swimmer is not found or some problem arises, that same class will delegate to
  # a strategy class to perform the swimmer name analysis (which will then require human
  #`supervision before commit).
  #
  # == Returns: when +false+, the additional "Swimmer name analysis" phase must be
  #    executed; +true+ if the "standard" data-import phase can go on.
  #
  def prescan_dao_list_for_unknown_swimmer_names
    is_ok = true
    unique_swimmers = @dao_list.map do |dao|
      {
        name:       dao.complete_name,
        year:       dao.year_of_birth,
        category:   dao.category_code,
        gender:     dao.gender_type_id
      }
    end.compact.uniq.sort{ |a, b| a[:name] <=> b[:name] }

    process_text_log << "\r\n** Final collected UNIQUE Swimmer names: **\r\n\r\n" <<
                        unique_swimmers.map{ |sh| sh[:name] }.join("\r\n") <<
                        "\r\n==== Tot.: #{ unique_swimmers.size } ====\r\n"

    unique_swimmers.each_with_index do |swimmer_hash, idx|
      swimmer_builder = DataImportSwimmerBuilder.build_from_parameters(
        @data_import_session,
        swimmer_hash[:name],
        swimmer_hash[:year],
        swimmer_hash[:gender],
        swimmer_hash[:category],
        false # force_team_or_swimmer_creation
      )
      swimmer = swimmer_builder.result_row
      unless swimmer
        process_text_log << "Prescan Swimmer names: '#{ swimmer_hash[:name] }' (#{swimmer_hash[:year]}, gender: #{swimmer_hash[:gender]}, #{ idx+1 }/#{ unique_swimmers.size }) uncertain. 'Swimmer name Analysis' needed.\r\n"
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: @data_import_session.id ).update_all(
        phase_3_log: "1-SWIMMER-CHECK:#{ idx+1 }/#{ unique_swimmers.size }"
      )
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end
