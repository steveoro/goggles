# encoding: utf-8

require 'data_import/services/data_import_entity_builder'


=begin

= DataImportSwimmerBuilder

  - Goggles framework vers.:  4.00.707
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Swimmer entity rows.

=end
class DataImportSwimmerBuilder < DataImportEntityBuilder

  # Searches for an existing Swimmer given the parameters, or it adds a new one,
  # if no matches are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportBadge;
  #     - negative (- #id) for a matching existing or commited row in Badge;
  #     - 0 on error/unable to process.
  #
  def self.build_from_parameters( data_import_session, swimmer_name, swimmer_year, gender_type,
    # TODO TMP FIX: remove default parameter value:
                                  force_team_or_swimmer_creation = true )
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!") unless gender_type.instance_of?(GenderType)
# DEBUG
#    puts "\r\nSwimmer -- build_from_parameters: data_import_session ID: #{data_import_session.id}, swimmer_name: #{swimmer_name}, swimmer_year: #{swimmer_year}"
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
                                                  # 2) Search for a Swimmer Alias:
      if_not_found  do
        search_for( DataImportSwimmerAlias, complete_name: @complete_name )
        unless @result_row                        # 2.1) Additional Fuzzy search on Swimmer Aliases:
          matcher = FuzzyStringMatcher.new( DataImportSwimmerAlias.all, :complete_name, )
          @result_row = matcher.find( @complete_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        end
        set_result( @result_row.swimmer ) if @result_row
      end

      if_not_found do
        if force_team_or_swimmer_creation
# DEBUG
          puts "Search failed: preparing add_new..."
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
        else
# DEBUG
          puts "Search failed: analyzing name..."
####################################################### FIXME
          # TODO
          # Not found & can't create a new team? => Do a full depth-first analyze of
          # the team name in search for a match and report the results via the builder
          # instance:
          # team_analysis_log = ''
          # sql_executable_log = ''
          # result = TeamNameAnalyzer.new.analyze(
              # team_name, season.id,
              # team_analysis_log,                    # The method will update these 2 variables in place
              # sql_executable_log,                   # (it uses the << operator)
              # 0.99, 0.8
          # )
          # result.data_import_session_id = data_import_session.id
                                                    # # Store the team analysis result:
          # if ( DataImportTeamAnalysisResult.where(
                # data_import_session_id: result.data_import_session_id,
                # searched_team_name:     result.searched_team_name,
                # desired_season_id:      result.desired_season_id
               # ).none?
          # )
            # result.save!
# # DEBUG
# #            puts "Team analysis saved."
            # data_import_session.phase_1_log ||= ''
            # data_import_session.sql_diff    ||= ''
            # data_import_session.phase_1_log << "#{ team_analysis_log }\r\n"
            # data_import_session.sql_diff    << "#{ sql_executable_log }\r\n"
          # end
          # Result not found w/o Team creation => Do a manual review of the analysis data.
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
