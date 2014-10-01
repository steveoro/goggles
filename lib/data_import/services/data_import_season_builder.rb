# encoding: utf-8


=begin

= DataImportSeasonBuilder

  - Goggles framework vers.:  4.00.531
  - author: Steve A.

  Generic strategy/service class to find an existing or add a new
  DataImportSeason.


=== Typical usage:

    DataImportSeasonBuilder.find_or_create_new( @data_import_session ) { corresponding_season }

=end
class DataImportSeasonBuilder

  attr_reader :data_import_session
  #-- -------------------------------------------------------------------------
  #++


  # Attempts to find a matching entity row or creates a new one, if missing.
  # Requires a mandatory block.
  #
  def self.find_or_create_new( data_import_session, &block )
    raise ArgumentError.new(
      "DataImportSeasonBuilder requires a valid DataImportSession instance and a block!"
    ) unless block_given? && data_import_session.instance_of( DataImportSession )
    DataImportSeasonBuilder.new( data_import_session, &block )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new instance.
  #
  def initialize( data_import_session, &block )
    @data_import_session = data_import_session
    # Evaluate the block passed within the context of this instance:
    instance_eval( &block )
  end
  #-- -------------------------------------------------------------------------
  #++


  # DataImportSeason relation getter / adder.
  # Searches for a corresponding / existing Season row. When not found a new temp row
  # (on a dedicated table with prefix 'data_import_') is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  # @deprecated Not used as of this version: NOTE that all referenced season_id below are ASSUMED as always positive (that is, coming from Season, not DataImportSeason !)
  #
  def corresponding_season()
    result_id   = 0
    result_row  = nil
    not_found   = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    description = I18n.t(:missing_data_warning, { scope: [:admin_import] })
    begin_date  = Date.parse( "#{Date.today.year - 1}-09-01" )
    end_date    = Date.parse( "#{Date.today.year}-06-30" )
    season_type_id = SeasonType.first.id            # FIXME ASSERT: season type is always "MASFIN"
    must_use_time_standards = true
                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    # ********* TODO SEARCH for any existing/conflicting Season rows
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        DataImportSeason.transaction do
          result_row = DataImportSeason.new(
            data_import_session_id:   @data_import_session.id,
            import_text:              '-',
            description:              description,
            begin_date:               begin_date,
            end_date:                 end_date,
            must_use_time_standards:  must_use_time_standards,
            season_type_id:           season_type_id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @data_import_session.phase_1_log << "\r\nDataImportSeason creation: exception caught during save!\r\n"
        @data_import_session.phase_1_log << "#{ $!.to_s }\r\n" if $!
        @data_import_session.save!
# FIXME
#        logger.error( "\r\n*** DataImportSeason creation: exception caught during save!" )
#        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
#        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# FIXME
#        logger.debug( "Created data_import_season, ID:'#{result_id}', '#{result_row.description}'." )
        @data_import_session.phase_1_log << "Created data_import_season, ID:'#{result_id}', '#{result_row.description}'.\r\n"
        @data_import_session.total_data_rows += 1
        @data_import_session.save!
      end                                           # --- END transaction ---
    end

    result_id
  end
  #-- -------------------------------------------------------------------------
  #++
end
