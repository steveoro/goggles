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

  - Goggles framework vers.:  4.00.737
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
  attr_reader :full_pathname, :dao_list, :data_import_session

  # These can be set later on:
  attr_accessor :logger,
                :do_not_consume_file  # default: false, when true the source datafile will be erased at the end of phase 1.2
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( full_pathname )
    @full_pathname = full_pathname
    @logger = nil
    tot_rows = 0
    @dao_list = []
    @data_import_session = nil
    @do_not_consume_file = false
    update_logs( "Datafile: #{full_pathname}" )
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

    update_logs( "Acquired #{tot_rows} data rows." )
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
    is_team_analysis_ok    = prescan_dao_list_for_unknown_team_names
    is_swimmer_analysis_ok = prescan_dao_list_for_unknown_swimmer_names
    is_ok = is_team_analysis_ok && is_swimmer_analysis_ok
                                                    # Update "last completed phase" indicator (10 = '1.0', parse):
    if @data_import_session.instance_of?( DataImportSession )
      @data_import_session.phase = 10
      @data_import_session.save!
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data-import Phase #1.2: parsing result serialization phase.
  #
  # This should be called only after a successful Phase 1.0.
  # (It checks for the last completed phase indicator in session and it returns +nil+
  # unless everything is ok.)
  #
  # The current implementation is able to rebuild/import the results of only *one*
  # MeetingSession at a time.
  #
  # Returns +nil+ only on error; otherwise it returns the current #data_import_session
  # instance.
  #
  # After a successful execution, remember to check the actual completion by peeking
  # at the #data_import_session.phase and whether...
  #   @data_import_session.data_import_team_analysis_results.any?
  #   @data_import_session.data_import_swimmer_analysis_results.any?
  # ... Are both +true+.
  #
  # The "Phase #2" of the "data-import wizard" allows the user to manually review
  # the digested/serialized data from the support tables, so that any mistakes or
  # conflicts may be edited (and solved) before the final commit phase (which is phase #3).
  #
  def phase_1_2_serialize( force_team_or_swimmer_creation = true )
    return nil unless @data_import_session.instance_of?( DataImportSession ) &&
                      @dao_list.instance_of?(Array) &&
                      @data_import_session.phase >= 10 && @data_import_session.phase < 12
    is_ok = false

    @meeting = nil
    # [Steve, 20150203] We assume Meeting & MeetingSession will ALWAYS be ALREADY EXISTING.
    # For this reason, the following meeting_header_row is kept here just to calm the builder
    # instances the may require it:
    meeting_header_row = {
      import_text: "(unavailable)",
      fields: {
        title: @header_fields_dao.code_name,
        organization: ""
      }
    }

    meeting_dates = @header_fields_dao.header_date
    scheduled_dates = MeetingDateParser.new.parse( meeting_dates )
    scheduled_date  = scheduled_dates.first if scheduled_dates.instance_of?( Array )

    if is_ok && @season                             # -- MEETING (digest/serialization) --
      meeting_builder = DataImportMeetingBuilder.build_from_parameters(
        @data_import_session,
        @season,
        @header_fields_dao,
        meeting_header_row,
        meeting_dates,
        force_team_or_swimmer_creation
      )
      @meeting = meeting_builder.result_row
    end

    if @meeting                                     # Check for possible validation failures:
      update_logs( "PHASE #1.2: checking possible Meeting validation failures..." )
      sql_diff = MeetingHeaderYearChecker.check_and_fix( @meeting )
      if sql_diff.size > 0
        @data_import_session.sql_diff << sql_diff
        update_logs( "PHASE #1.2: associated Meeting corrected." )
      end
    end
                                                    # -- MEETING SESSION (digest/serialization) --
    meeting_session = nil
    if @meeting                                     # Retrieve default meeting session: (used only for new/missing meeting events or programs)
      meeting_session_builder = DataImportMeetingSessionBuilder.build_from_parameters(
        @data_import_session,
        @meeting,
        @header_fields_dao,
        meeting_dates, # meeting_dates_text
        scheduled_date,
        force_missing_meeting_creation
      )
      meeting_session = meeting_session_builder.result_row
    end
                                                    # --- CATEGORY (digest/serialization) --
    if is_ok && meeting_session
      update_logs( "PHASE #1.2: processing CATEGORY headers..." )
      is_ok = process_category_headers(
        season_starting_year,
        meeting_session,
        scheduled_date,
        force_team_or_swimmer_creation
      )
    end
# TODO MISSING INFO!
                                                    # --- RELAY (digest/serialization) --
    # if is_ok && meeting_session
      # update_logs( "PHASE #1.2: processing RELAY headers..." )
      # is_ok = process_relay_headers(
          # @full_pathname,
          # @data_import_session,
          # @season,
          # season_starting_year,
          # @meeting,
          # meeting_session,
          # @result_hash[:parse_result],
          # scheduled_date,
          # force_team_or_swimmer_creation
      # )
    # end
                                                    # After having successfully stored the contents, remove the file
    if is_ok
      update_logs( "-- phase_1_parse(#{ @full_pathname }): file processed and 'digested'(serialized) on support tables." )
      unless @do_not_consume_file
        update_logs( "Consuming it..." )
        FileUtils.rm( @full_pathname )
      end
      @data_import_session.phase = 12               # Update "last completed phase" indicator (12 = '1.2')
      @data_import_session.save!
      update_logs(
        "\r\nFile '#{File.basename( @full_pathname )}', created session ID: #{ @data_import_session.id }\r\n" <<
        "Total file lines ....... : #{ @result_hash[:line_count] }\r\n" <<
        "Total data headers ..... : #{ @result_hash[:total_data_rows] }\r\n" <<
        "Actual stored rows ..... : #{ @stored_data_rows }\r\n" <<
        "File processed.\r\nData-import PHASE #1.2 DONE."
      )
    end
                                                    # Update the global log with the whole phase 1 log
    update_logs(
      "\r\nPHASE #1.2 END, returning #{ is_ok ? '(current session)' : 'NIL'}.",
      :info, true
    )
                                                    # Rewrite the logs & return the result:
    write_import_logfile
    write_sql_diff_logfile if is_ok                 # (Dump the SQL diff file only if phase #1.1 is not required)

    is_ok ? @data_import_session : nil
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Stores the text +msg+ into the logs (both on the logger & on the support table).
  def update_logs( msg, method = :info )
    @logger.send( method, msg ) if @logger
    if @data_import_session
      @data_import_session.phase_1_log = @data_import_session.phase_1_log + "#{msg}\r\n"
    end

    process_text_log << "#{msg}\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++


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
      try_detect_season_from_header_fields( 'MASCSI' )
                                                    # (@season must be defined after this point)
      update_logs( "#{ I18n.t('admin_import.season_not_found') })}\r\n#{ @header_fields_dao }" ) and return nil unless @season
    else
      update_logs( "Specified season ID=#{@season.id}. Parsing file..." )
    end
                                                    # Get the remaining default values from the season instance:
    @header_fields_dao.header_year     = @season.header_year # override header_year and use for safety the one from the season
    @header_fields_dao.edition         = @season.edition
    @header_fields_dao.edition_type_id = @season.edition_type_id
    @header_fields_dao.timing_type_id  = @season.timing_type_id
    update_logs( "Parsed header fields: #{@header_fields_dao}\r\n" )

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

    team_names = unique_names.join("\r\n")
    update_logs(
      "\r\n** UNIQUE Team names: **\r\n\r\n#{ team_names }" <<
      "\r\n==== Tot. teams: #{ unique_names.size } ====\r\nAnalyzing name by name...\r\n"
    )

    unique_names.each_with_index do |team_name, idx|
      team_builder = DataImportTeamBuilder.build_from_parameters(
        @data_import_session,
        team_name,
        @season,
        false # force_team_or_swimmer_creation
      )
      team = team_builder.result_row
      unless team
        update_logs( "Prescan Team names: '#{ team_name }' (#{ idx+1 }/#{ unique_names.size }) uncertain. 'Team name Analysis' needed." )
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
        category:   CategoryType.parse_category_type_from_import_text( @season, dao.category_code ),
        gender:     GenderType.find_by_id( dao.gender_type_id.to_i )
      }
    end.compact.uniq.sort{ |a, b| a[:name] <=> b[:name] }

# DEBUG
#    swimmer_names = unique_swimmers.map{ |sh| sh[:name] }.join("\r\n")
    update_logs(
# DEBUG
#      "\r\n** UNIQUE Swimmer names: **\r\n\r\n#{ swimmer_names }" <<
      "\r\n==== Tot. swimmers: #{ unique_swimmers.size } ====\r\nAnalyzing name by name...\r\n"
    )

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
        update_logs( "Prescan Swimmer names: '#{ swimmer_hash[:name] }' (#{swimmer_hash[:year]}, gender: #{swimmer_hash[:gender].code}, #{ idx+1 }/#{ unique_swimmers.size }) uncertain. 'Swimmer name Analysis' needed." )
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

# FIXME ********************************************************
# FIXME ********************************************************
# FIXME ********************************************************

  # "Digest" process for the :category_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_category_headers( season_starting_year, meeting_session, scheduled_date,
                                force_team_or_swimmer_creation = false )
    is_ok = true
# TODO REWRITE using dao_list & existing member variables
    @dao_list.each do |dao|
      gender_type   = gender_type.find_by_id( dao.gender_type_id )
      raise "Unrecognized GenderType in result dao! (id=#{ dao.gender_type_id }, #{dao})" unless gender_type
      category_type = CategoryType.where( season_id: @season.id, code: dao.category_type_code ).first
      raise "Unrecognized CategoryType in result dao! (season.id=#{ season.id }, code='#{ dao.category_type_code }', #{dao})" unless category_type
      stroke_type   = StrokeType.find_by_code( dao.stroke_type_code, is_eventable: true )
      raise "Unrecognized StrokeType in result dao! (code='#{ dao.stroke_type_code }', #{dao})" unless stroke_type
      length_in_meters = dao.length_in_metres.to_i

# FIXME ********************************************************
# FIXME ********************************************************
# FIXME ********************************************************
# DEBUG
#      data_import_session.phase_1_log << "CATEGORY HEADER: Current header_row: #{ header_row.inspect }\r\nResulting category_type_id=#{ category_type.id }, gender_type_id=#{ gender_type.id }, stroke_type_id=#{ stroke_type.id }, data_import_session ID=#{ data_import_session.id }"

      meeting_program_builder = DataImportMeetingProgramBuilder.build_from_parameters(
        @data_import_session,
        @season,
        meeting_session,
        header_row,
        header_index,
        gender_type, category_type, stroke_type,
        length_in_meters,
        scheduled_date,
        detail_rows.size,
        previous_begin_time,
        previous_duration_in_secs
      )
      meeting_program = meeting_program_builder.result_row
      is_ok = ! meeting_program.nil?
      if meeting_program                            # Update prev. begin & duration times:
        begin_time = meeting_program.begin_time ? meeting_program.begin_time :
                                                  scheduled_date.to_time + (8 * 3600)
        previous_duration_in_secs = previous_begin_time ? (begin_time - previous_begin_time).abs : 120
# DEBUG
#        puts "\r\nBEGIN TIME DELTA for M.PRGs(MIR): order:#{meeting_program.event_order} " <<
#             "- meeting_program.begin_time: #{meeting_program.begin_time}\r\n" <<
#             "- scheduled_date.to_time: #{scheduled_date.to_time}\r\n" <<
#             "- previous_begin_time: #{previous_begin_time} |=> begin_time: #{begin_time}\r\n" <<
#             "- DELTA in secs: #{ begin_time.to_f - previous_begin_time.to_f }" <<
#             "=> resulting duration_in_secs: #{ previous_duration_in_secs }"
        previous_begin_time = begin_time
      end
      return unless is_ok                           # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index do |detail_row, detail_row_idx|
                                                    # -- MEETING INDIVIDUAL RESULT (digest part) --
        mir_builder = DataImportMeetingIndividualResultBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows.size,
          gender_type, category_type,
          force_team_or_swimmer_creation
        )
        is_ok = ! mir_builder.result_row.nil?
        return unless is_ok
      end                                           # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1.2-CAT:#{header_index+1}/#{category_headers_ids.size}"
      )
    end

    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end
