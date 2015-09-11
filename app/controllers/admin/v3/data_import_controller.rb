# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


=begin

= Admin::V3::DataImportController

  - version:  4.00.809
  - author:   Steve A.

  Third incarnation of the Admin-interface/Data-import controller.

=end
class Admin::V3::DataImportController < ApplicationController

  layout 'admin_v3_data_import'


  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  #-- -------------------------------------------------------------------------
  #++


  # Shows the list of existing data-import sessions, allowing resume of any
  # step or the creation of a new one.
  #
  def index
    @existing_import_sessions = DataImportSession.where( user_id: current_admin.id )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Parses the specified data-file, serializing the recognized contents on disk.
  #
  # === Params:
  # - :datafile => the data file to be parsed, posted via file-select form
  #
  def parse_file
# DEBUG
    logger.debug "\r\n\r\n!! ------ admin_import::step2_checkout -----"
    logger.debug "PARAMS: #{params.inspect}"
    redirect_to admin_v3_data_import_index_path() and return unless params[:datafile]

    logger.debug "FILENAME...: #{params[:datafile].original_filename }"

    # TODO parse datafile:
    # 1) Parse file format => retrieve parser instance & parsing defs from file format parser
    # 2) Launch parser instance with parameters (parsing defs)
    # 3) Retrieve result from parser instance

    @result = nil
    if @result.nil?
      flash[:error] = I18n.t("admin_import.parsing_error_nil_result")
      redirect_to admin_v3_data_import_index_path()
      return
    end
                                                    # Create a new data-import session:
    @data_import_session = create( @result )
                                                    # Serialize the result:
    binary_data = @result.serialize
    # TODO Store result on file or on DB

    redirect_to admin_v3_data_import_team_analysis_path( 1 ) # @data_import_session.id
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def team_analysis
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def team_confirm
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def swimmer_analysis
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def swimmer_confirm
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def edit
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def commit
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def destroy
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Creates a new data-import session returning its instance.
  # Requires a +parse_result+ parameter, assumed to be an instance of V3::ParseResult
  #
  def create( parse_result )
    DataImportSession.create(
      phase:            0,
      file_format:      "csi-#{@header_fields_dao.prefix}",
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

end
