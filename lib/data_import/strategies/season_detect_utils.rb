# encoding: utf-8


=begin

= SeasonDetectUtils

  - Goggles framework vers.:  4.00.737
  - author: Steve A.

  Data-Import/Digest Module incapsulating all season detector utility methods,
  shared by the DataImporter class (for FIN-type datafiles) & by the CsiResultParser class.

  Extracted from the original DataImporter implementation.

  == Defines / assumes the existance of:
  - @full_pathname: the source datafile path name

  - @season: a valid instance of Season. Returned and defined after calling any of
             the included methods.

  - @header_fields_dao: HeaderFieldsDAO instance obtained from parsing the @full_pathname

=end
module SeasonDetectUtils

  # Tries to detect/parse the season of the data files by looking at the container
  # path of the files.
  #
  # This method updates directly the internal #season member but it does nothing
  # if it has already a value.
  #
  # === Example:
  #
  #     "uploads"  [ / ] "results.132"  [ / ]  "ris20121123test.txt"
  #
  # => This will force Season with ID #132 for all the files contained therein.
  #
  #
  # === Returns
  # A Season instance when successfull or +nil+ when unable to parse the pathname.
  #
  def try_detect_season_from_file_path()
    return @season if @season.instance_of?( Season )

    container_dir_parts = File.dirname( @full_pathname ).split(File::SEPARATOR).last.split('.')
    if ( container_dir_parts.size == 2 )
      @season = Season.find_by_id( (container_dir_parts[1]).to_i )
      update_logs( "Detected forced season ID=#{ @season.id } from container folder name. Parsing file..." ) if @season
    end
    if @season
      update_logs( "Detected forced season ID=#{ @season.id } from container folder name. Parsing file..." )
    else
      update_logs( "Season non forced by data-file path ('#{ @full_pathname }')..." )
    end
    @season
  end


  # Tries to detect the season of the data files by parsing the header fields of the.
  # file name.
  # (Mainly by looking at the time stamp and deciding which Season it could be,
  #  according to the file type.)
  #
  # This method updates directly the internal #season member but it does nothing
  # if it has already a value.
  #
  # === Params:
  # The season_type_code (default: 'MASFIN')
  #
  # === Returns
  # A Season instance when successfull or +nil+ when unable to parse the pathname.
  #
  def try_detect_season_from_header_fields( season_type_code = 'MASFIN' )
    return @season if @season.instance_of?( Season )

    header_year = @header_fields_dao.header_year
    mas_season_type = SeasonType.find_by_code( season_type_code )
    @season = Season.where([
      '(header_year = ?) AND (season_type_id = ?)',
      header_year, mas_season_type.id
    ]).first
    if @season
      update_logs( "Detected season ID=#{@season.id} from file header date. Parsing file..." )
    else
      update_logs( "Un-detected season for #{@header_fields_dao}." )
    end
    @season
  end
  #-- -------------------------------------------------------------------------
  #++
end

