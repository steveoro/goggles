# encoding: utf-8

require 'data_import/services/data_import_entity_builder'
require 'data_import/services/swimmer_name_analyzer'


=begin

= DataImportSwimmerBuilder

  - Goggles framework vers.:  4.00.713
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Swimmer entity rows.

 Normally the automatic Swimmer creation procedure is disabled and requires a
 separate pre-analysis stage, with a statistical report of the best-match
 data before actual data insertion.

 For this reason, the +force_team_or_swimmer_creation+ parameter should be set
 to +true+ only after the analysis phase while processing the analysis result rows.

=== Entity look-up order/algorithm:
  1) Scan Swimmer to seek rows matching:
     - complete_name
     - gender_type
     - year_of_birth

  1.1) If not found, scan DataImportSwimmer to seek rows matching all of the above;

  2) If not found, scan for an existing DataImportSwimmerAlias; any candidate is
     fuzzy-matched against a FuzzyStringMatcher::BIAS_SCORE_BEST seeked name;

  3) If not found, scan Swimmer with some fuzzy-logic metric to seek for a
     "best-match", but using a very-high bias score (>= 0.98).
     This should be the last resort, since a positive match could be wrong
     anyway if the bias is not high enough.

  4) If all else fails, insert a new Swimmer ONLY if the force creation flag has been
     set to true (force_team_or_swimmer_creation).
     Else, save the analysis' result and return +nil+, thus signaling the need of
     a manual review/selection of the candidates found.

=end
class DataImportSwimmerBuilder < DataImportEntityBuilder

  # Searches for an existing Swimmer given the parameters, or it adds a new one,
  # if no matches are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportSwimmer;
  #     - negative (- #id) for a matching existing or commited row in Swimmer;
  #     - 0 on error/unable to process.
  #
  def self.build_from_parameters( data_import_session, swimmer_name, swimmer_year, gender_type,
                                  force_team_or_swimmer_creation )
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!") unless gender_type.instance_of?(GenderType)
# DEBUG
#    puts "\r\nSwimmer -- build_from_parameters: data_import_session ID: #{data_import_session.id}, swimmer_name: #{swimmer_name}, swimmer_year: #{swimmer_year}, gender_type_id: #{gender_type.id}"
    self.build( data_import_session ) do
      entity      Swimmer

      set_up do
        set_result( nil ) and return if swimmer_name.nil? || swimmer_name.size < 2
        @complete_name = swimmer_name.gsub(/\s+/, ' ')
        # We must find a "separator length" that at least results in a last_name + first_name
        # array.
        splitted_name = swimmer_name.gsub(/\s{3,}/, '  ').split('  ') # Normalize multi-space separator between last_name and first_name
        splitted_name = (splitted_name[0]).split(' ') if splitted_name.size < 2
        if splitted_name.size == 2                      # Use last & first name only when the splitting is certain
          @last_name  = splitted_name[0]
          @first_name = splitted_name.reject{ |s| s == @last_name }.join(' ')
        end
      end
                                                  # 1) Default search: Swimmer + DataImportSwimmer:
      search do
        primary   [
          "(year_of_birth = ?) AND (gender_type_id = ?) AND (complete_name LIKE ?)",
          swimmer_year, gender_type.id, @complete_name+'%'
        ]
        secondary [
          "(data_import_session_id = ?) AND (year_of_birth = ?) AND (gender_type_id = ?) AND (complete_name LIKE ?)",
          data_import_session.id, swimmer_year, gender_type.id, @complete_name+'%'
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!"   if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end
                                                  # 2) Search for a Swimmer ALIAS:
      if_not_found  do
        search_for( DataImportSwimmerAlias, complete_name: @complete_name )
        unless @result_row                        # 2.1) Additional Fuzzy search on Swimmer Aliases:
          matcher = FuzzyStringMatcher.new( DataImportSwimmerAlias.all, :complete_name )
          @result_row = matcher.find( @complete_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        end
        set_result( @result_row.swimmer ) if @result_row
      end

      if_not_found do
        unless force_team_or_swimmer_creation
# DEBUG
#          puts "Search failed: analyzing name (prefilter: '#{@last_name}', gender: #{gender_type.id})..."

          # Not found & can't create a new row? => Do a full depth-first analyze of
          # the swimmer name in search for a match and report the results via the builder
          # instance:
          analysis_log = ''
          sql_executable_log = ''
          analyzer = SwimmerNameAnalyzer.new
          # Pre-filter swimmers to speed-up the searches:
          analyzer.swimmers = Swimmer.where( "complete_name LIKE \"%#{@last_name}%\"" ).reload if @last_name.to_s.length > 0
# DEBUG
#          analyzer.swimmers.each{ |row| puts "\r\n- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
          result = analyzer.analyze(
              @complete_name,
              swimmer_year,
              gender_type.id,
              analysis_log,                         # The method will update these 2 variables in place
              sql_executable_log,                   # (it uses the << operator)
              0.99, 0.8
          )
# DEBUG
#          puts analysis_log
#          puts "\r\n#{ result }"
                                                    # Serialize the analysis result, if it's the case:
          if result.can_insert_alias || (! result.can_insert_swimmer)
            result.data_import_session_id = data_import_session.id
                                                    # Store the analysis result only if there aren't any yet:
            if ( DataImportSwimmerAnalysisResult.where(
                  data_import_session_id: result.data_import_session_id,
                  searched_swimmer_name:  result.searched_swimmer_name,
                  desired_year_of_birth:  result.desired_year_of_birth,
                  desired_gender_type_id: result.desired_gender_type_id
                 ).none?
            )
              result.save!
# DEBUG
#              puts "Swimmer analysis saved."
              data_import_session.phase_1_log ||= ''
              data_import_session.sql_diff    ||= ''
              data_import_session.phase_1_log << "#{ analysis_log }\r\n"
              data_import_session.sql_diff    << "#{ sql_executable_log }\r\n"
            end
          end
          # If the analysis result tells us that we can create a new swimmer, we'll
          # do it now by overriding the value of the flag, so that we don't have to
          # manually review dozens of not-found results that could be created automatically.
          force_team_or_swimmer_creation = result.can_insert_swimmer
        end
        # At this point, either we have an alias-analysis result already stored and
        # we'are ready for human confirmation, or we don't.
        # If we are authorized to create a brand new entity row, we'll do it now:
        if force_team_or_swimmer_creation
# DEBUG
#          puts "Search failed: preparing add_new..."
          attributes_for_creation(
            data_import_session_id: data_import_session.id,
            import_text:            "#{swimmer_name}, #{swimmer_year}",
            last_name:              @last_name,
            first_name:             @first_name,
            complete_name:          @complete_name,
            year_of_birth:          swimmer_year,
            gender_type_id:         gender_type.id,
            user_id:                1 # (don't care)
          )
          add_new
        end
        # ELSE: Result not found (not yet set) & row creation still disabled?
        #       |=> Force a manual review of the serialized analysis data.
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
