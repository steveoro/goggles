# encoding: utf-8


=begin

= DataImportSeasonBuilder

  - Goggles framework vers.:  4.00.531
  - author: Steve A.

  Generic strategy/service class to find an existing or add a new
  DataImportSeason row.


=== Typical usage:

    DataImportSeasonBuilder.find_or_create_new( @data_import_session ) do
      season_fields( header_date )
      corresponding_season( header_date )
    end

=end
class DataImportSeasonBuilder

  # Creates a new instance.
  #
  def initialize( data_import_session, &block )
    @data_import_session = data_import_session
    # Evaluate the block passed within the context of this instance:
    instance_eval( &block )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Set-up for the fields used by this entity builder.
  def season_fields( header_date )
    # FIXME Description will thus require to be hand-edited:
    @description    = I18n.t( 'admin_import.missing_data_warning' )
    @header_date    = header_date.kind_of?( Date ) ? header_date : Date.today
    year            = @header_date.month < 10 ? @header_date.year - 1 : @header_date.year
    # FIXME This is an approximation, it should include most of the seasons:
    @begin_date     = Date.parse( "#{year}-09-01" )
    @end_date       = Date.parse( "#{year + 1}-08-30" )
    @header_year    = "#{@begin_date.year}/#{@end_date.year}",
    # FIXME ASSERT: season type is always "MASFIN"
    @season_type_id = SeasonType.first.id
    # FIXME This is plain wrong:
    @edition        = 0

    @primary_search_options = {
      condition: "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
      values:    [ @season_type_id, @begin_date, @end_date ]
    }
    @secondary_search_options = {
      condition: "(data_import_session_id = ?) AND (season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
      values:    [ @data_import_session.id, @season_type_id, @begin_date, @end_date ]
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  # "Corresponding entity row" getter / adder.
  #
  # (1) It searches for a corresponding / existing entity row given the parameters.
  # (2) When no corresponding rows are found in the primary entity, the correlated
  # temporary 'data_import_' entity is searched next.
  #
  # (3) When neither are a good match for a "corresponding row", a fresh new temp
  # is added in the dedicated data-import table of the entity (the same table scanned
  # on step 2).
  #
  # === Parameters:
  #   - the header_date parsed from the file name.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  # @deprecated Not used as of this version: NOTE that all referenced season_id below are ASSUMED as always positive (that is, coming from Season, not DataImportSeason !)
  #
  def add_new()
    begin
      DataImportSeason.transaction do             # --- BEGIN transaction ---
        result_row = DataImportSeason.new(
          data_import_session_id:   @data_import_session.id,
          import_text:              @header_date,
          description:              @description,
          begin_date:               @begin_date,
          end_date:                 @end_date,
          season_type_id:           @season_type_id,
          header_year:              @header_year,
          edition:                  @edition
        )
        result_row.save!                          # raise automatically an exception if save is not successful
      end
    rescue                                        # --- RESCUE (failed) transaction ---
      @data_import_session.phase_1_log << "\r\nDataImportSeason creation: exception caught during save!\r\n"
      @data_import_session.phase_1_log << "#{ $!.to_s }\r\n" if $!
    else
      result_id = result_row.id
      @result_row = result_row
      @data_import_session.phase_1_log << "Created data_import_season, ID:'#{result_id}', '#{result_row.description}'.\r\n"
      @data_import_session.total_data_rows += 1
    end                                           # --- END transaction ---

    @data_import_session.save!
    result_id
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Searches for the first occurrence of a row of the specified entity,
  # given the parameters.
  # When found, the resulting row updates the internal member for the result
  # value.
  #
  # Returns the resulting row ID, zero when none was found.
  # Returns a positive ID for a row found in a "data-import" temp table.
  # Returns a negative ID for one found in the primary entity table.
  #
  def search_for( entity, season_type_id, begin_date, end_date )
    result_id = 0
# FIXME (no logger class available)
#    logger.debug( "Seeking existing DataImportSeason @ #{header_date}..." )
    @data_import_session.phase_1_log << "Seeking existing #{entity.name} @ #{begin_date}-#{end_date}, type: #{season_type_id}...\r\n"

    result_row = entity.where(                      # ASSERT: there can be only 1 row keyed by this tuple:
      [ "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
        season_type_id, begin_date, end_date ]
    ).first

    if result_row
# FIXME (no logger class available)
#      logger.debug( "DataImportSeason found! (#{result_row.description})" )
      @data_import_session.phase_1_log << "#{entity.name} found! (#{result_row.description})\r\n"
      @data_import_season = result_row
      # We must differentiate the result: positive for a 'data_import' entity, negative otherwise
      result_id = result_row.id * (entity.name =~ /DataImport/ ? 1 : -1)
    end

    result_id
  end
  #-- -------------------------------------------------------------------------
  #++
end
