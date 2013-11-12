# encoding: utf-8

require 'fileutils'
require 'fuzzystringmatch'
require 'common/format'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.89.20131110
  - author: Steve A.

== FinResultParserTools module

 Container dedicated to parsing tools for FIN Results files.

 FIN Results are swimming meeting result text files, written mostly in UTF-8 italian
 locale (since F.I.N. is the Italian Swimming Federation).

 All the RegExp used by this Parser class assume the file to be processed is compliant
 with the format used in these kind of files. 

=end
module FinResultParserTools

  # Parses the data-import header fields encoded in the filename.
  # This method assumes data-import filename format as follows:
  #
  # <prefix><date_ISO><code><.extension>
  #
  # - prefix: a variable length (usually 3 chars) prefix, stating the format of the data
  # - date_ISO: the encoded date of the data, in ISO-format without separators ("YYYYmmdd")
  # - code: a variable length string code, which identifies the Meeting, indipendently from season or year
  # - extension: usually, "txt"
  #
  # == Returns:
  # An Hash with the format:
  #
  #    {
  #       :prefix => prefix string,
  #       :header_date => Date instance parsed from date_ISO,
  #       :code => code string
  #    }
  #
  def self.parse_filename_fields( full_pathname )
    ext  = File.extname(full_pathname)
    name = File.basename(full_pathname, ext)
    date_start_idx = name =~ /\d{8}/
    code_start_idx = name =~ /(?<=\d{8})\D/
    header_date = Date.parse( name[date_start_idx .. code_start_idx-1] )
    {
      :prefix       => name[ 0 .. date_start_idx-1 ],
      :header_date  => header_date,
      :code         => name[ code_start_idx .. name.size ]
    }
  end
  # ---------------------------------------------------------------------------


  # Parses a text date extracted from a FIN result text file. 
  #
  def self.parse_meeting_date( text_token )
# DEBUG
#    puts("parse_meeting_date( '#{text_token}' ) called.")
    date_num_idx = text_token =~ /\d{1,2}((\/|-|\,)\d{1,2})?\s/ui
    month_idx    = text_token =~ /(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}/ui
    year_idx     = text_token =~ /\s\d{2,4}/ui

    day       = text_token[ date_num_idx .. date_num_idx+1 ].strip if date_num_idx
    month     = text_token[ month_idx .. month_idx+2 ].downcase if month_idx
    month_num = ['gen','feb','mar','apr','mag','giu','lug','ago','set','ott','nov','dic'].index( month )
    year      = text_token[ year_idx .. year_idx+4 ].strip if year_idx

    text_date = "#{year}-#{sprintf( "%#{2.2}i", month_num.to_i+1)}-#{day}"
# DEBUG
#    puts("parse_meeting_date(): resulting text date: '#{text_date}'.")
    Date.parse( text_date )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Given the individual results time token extracted from the text file,
  # returns true if it contains the "out of race" code. false otherwise.
  #
  def self.parse_out_of_race_from_result_time( result_time )
    ! ( result_time =~ /Fuori gara|F\.G\./i ).nil?
  end

  # Given the individual results time token extracted from the text file,
  # returns true if it contains the "disqualified" code. false otherwise.
  #
  def self.parse_disqualified_from_result_time( result_time )
    ! ( result_time =~ /Ritir|Squal/i ).nil?
  end

  # Given the individual results time token extracted from the text file,
  # returns the disqualification_code_types.ID, when possible. 0 otherwise
  #
  def self.parse_disqualification_code_type_id_from_result_time( result_time )
    if result_time =~ /Ritir/i
      DisqualificationCodeType::DSQ_RETIRED_ID
    elsif result_time =~ /Squal/i
      DisqualificationCodeType::DSQ_FALSE_START_ID
    else
      0
    end
  end
  # ---------------------------------------------------------------------------

  # Given the individual results time token extracted from the text file,
  # returns an Array containing the integer values for [minutes, seconds, hundreths].
  #
  def self.parse_mins_secs_hds_from_result_time( result_time )
    if ( result_time =~ /\d{1,2}'\d\d"\d\d/ui ).nil?
      [0, 0, 0]
    else
      result_time.split(/\'|\"/).collect!{ |e| e.to_i }
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Tries to return a City name (string) from a team name.
  # == Returns:
  # A comma-separated text containing: "name,area,zip,country,country_code";
  # An empty string on failure.
  #
  def self.guess_city_from_team_name( team_name )
    case team_name
    when /ADRIA/i
      "Adria,Rovigo,45011"
    when /ANCONA/i
      "Ancona,Ancona"
    when /BASTIA/i
      "Bastia,Savona,17031"
    when /BOLOGNA|DE AKKER|FANCIULLO/i
      "Bologna,Bologna"
    when /BERGAM/i
      "Bergamo,Bergamo"
    when /BRESCIA/i
      "Brescia,Brescia"
    when /BRINDISI/i
      "Brindisi,Brindisi,72100"
    when /FERRARA|FERRARESI/i
      "Ferrara,Ferrara"
    when /FIDENZA/i
      "Fidenza,Parma,43036"
    when /FIRENZE/i
      "Firenze,Firenze"
    when /FORLI/i
      "Forli',Forli'"
    when /LIVORN/i
      "Livorno,Livorno"
    when /LUGO/i
      "Lugo,Ravenna,48022"
    when /MANTOV|MINCIO/i
      "Mantova,Mantova"
    when /MILAN/i
      "Milano,Milano"
    when /MODEN|ESTENSE/i
      "Modena,Modena"
    when /MOLINELLA/i
      "Molinella,Bologna,40062"
    when /NAPOLI/i
      "Napoli,Napoli"
    when /OBER FERR|REGGIANA|TRICOLORE|DINAMI/i
      "Reggio Emilia,Reggio Emilia"
    when /PADOVA/i
      "Padova,Padova"
    when /PARMA|PARMENS|PARMIGIAN/i
      "Parma,Parma"
    when /PAVIA/i
      "Pavia,Pavia,27100"
    when /PESAR/i
      "Pesaro,Pesaro"
    when /PONTEDERA/i
      "Pontedera,Pisa,56025"
    when /PRATO/i
      "Prato,Prato,59100"
    when /RAVENN/i
      "Ravenna,Ravenna"
    when /RICCIONE/i
      "Riccione,Rimini,47838"
    when /RIMINI/i
      "Rimini,Rimini"
    when /ROMA|ANIENE|/i
      "Roma,Roma"
    when /ROVIGO/i
      "Rovigo,Rovigo,45100"
    when /S\.BENEDET|SAMBENEDET/i
      "San Benedetto,La Spezia,19020"
    when /SAN MARINO|S\.MARINO/i
      "San Marino,San Marino,47890,Rep. di San Marino,RSM"
    when /SAVENA/i
      "San Lazzaro di Savena,Bologna,40068"
    when /SASSUOLO/i
      "Sassuolo,Modena,41049"
    when /TRENTO/i
      "Trento,Trento"
    when /TREVISO/i
      "Treviso,Treviso,31100"
    when /TREVIGLIO/i
      "Treviglio,Bergamo,24047"
    when /TRIEST/i
      "Trieste,Trieste"
    when /VENEZIA/i
      "Venezia,Venezia"
    when /VERON/i
      "Verona,Verona"
    else
      ''
    end
  end

  # Strips a City or Area or Country name of common prefixes, abbreviations and
  # connections or grammar characters, in a sort of a "normalization process".
  #
  # Note that this name should only be used on City members or places names,
  # since rules for abbreviating persons' names do not apply in the same manner.
  #
  # === Returns
  # An array or "normalized" tokens that, if joined together,
  # still "look like" the actual name of the city.
  #
  def self.get_token_array_from_city_name( full_city_name )
    arr_of_tokens = full_city_name.split(/[\'\,\s\.]/)
    arr_of_tokens.delete_if{ |el|
      # TODO Add more frequently used abbreviations
      [ 'di','nel','nell','del','dell','in',
        'su', 'sul', 'sull',
        'da','dal','dall','san','s','sant'
      ].include?(el.downcase)
    }
  end

  # Compare two city-related names (either city name, area or country),
  # using the normalization process from #get_token_array_from_city_name().
  #
  # Note that this name should only be used on City members or places names,
  # since rules for abbreviating persons' names do not apply in the same manner.
  #
  # === Returns
  # true if there seems to be a match, false otherwise.
  #
  def self.compare_city_member_strings( possibly_new_city_name, existing_city_name )
    possibly_new_normalized = FinResultParserTools.get_token_array_from_city_name( possibly_new_city_name ).join(' ')
    existing_normalized_arr = FinResultParserTools.get_token_array_from_city_name( existing_city_name )
    reg = Regexp.new( existing_normalized_arr.join('\s.*'), Regexp::IGNORECASE )
    match = ( possibly_new_normalized =~ reg )
    ! match.nil?
  end

  # Strips a City or Area or Country name of common prefixes, abbreviations and
  # connections or grammar characters, in a sort of a "normalization process".
  #
  # === Returns
  # +true+ if the comparison "seems a match".
  #
  def self.seems_to_be_the_same_city( new_city_name, existing_city_name,
                                      new_area_name, existing_area_name,
                                      new_country_code, existing_country_code )
    ( compare_city_member_strings( new_city_name, existing_city_name ) &&
      compare_city_member_strings( new_area_name, existing_area_name ) &&
      (new_country_code.upcase == existing_country_code.upcase)
    )
  end
  # ---------------------------------------------------------------------------


  # Using a fuzzy-string matching metric, this method loops on all instances
  # supplied as parameter to seek the highest-scoring match.
  #
  # The matching value can be any string.
  # The array can contain any Model/Class instance, as long as it responds to
  # the specified method to retrieve the comparison value.
  # A score_bias can be specified to override the minimum sufficient acceptable score
  # (default = 0.6 -- which is kinda low and permissive, depending on the context).
  #
  # === Returns
  # The item of the array with the best score. +nil+ if none has a sufficient
  # matching score (greater than the bias).
  #
  def self.find_best_fuzzy_match( matching_string, array_of_rows, getter_for_comparison,
                                  alternative_getter_method = nil, score_bias = 0.6 )
    raise "array_of_rows does not support the :each enumerator!" unless array_of_rows.respond_to?(:each)
    result_row = nil
    matcher    = FuzzyStringMatch::JaroWinkler.create()
    best_score = 0

    array_of_rows.each { |row|
# DEBUG
#      raise "row does not respond to '#{getter_for_comparison}'!" unless row.respond_to?( getter_for_comparison )
      comparison_string = row.send( getter_for_comparison )
      match_score = matcher.getDistance( matching_string.upcase, comparison_string.upcase )
      if ( (match_score > score_bias) && (best_score < match_score) )
# DEBUG
#        puts( "find_best_fuzzy_match(): '#{matching_string}' vs. '#{comparison_string}' => score: #{match_score}" )
        best_score = match_score
        result_row = row
      end
                                                    # Search for a match also with the alternative getter, when provided
      if ( alternative_getter_method )
# DEBUG
#        raise "row does not respond to '#{alternative_getter_method}'!" unless row.respond_to?( alternative_getter_method )
        comparison_string = row.send( alternative_getter_method )
        match_score = matcher.getDistance( matching_string.upcase, comparison_string.upcase )
        if ( (match_score > score_bias) && (best_score < match_score) )
# DEBUG
#          puts( "find_best_fuzzy_match(): '#{matching_string}' vs. '#{comparison_string}' => score: #{match_score} (alt.)" )
          best_score = match_score
          result_row = row
        end
      end
      break if (best_score > 9.9999)
    }
    result_row
  end


  # Similarly to #find_best_fuzzy_match(), uses a fuzzy string search and simply
  # collects the best matches found, given the bias score.
  #
  # Matches are collected in FIFO order, with each one selected having a better
  # score than the previous one. The resulting array is sorted on score.
  #
  # === Returns
  # An array of Hash having each element as:
  #
  #  { :score => <match_score>, :row => <match_row_instance> }
  # 
  # Where the match_row_instance is a match that has scored higher than the bias.
  #
  def self.collect_best_fuzzy_matches( matching_string, array_of_rows, getter_for_comparison,
                                       score_bias = 0.6 )
    raise "array_of_rows does not support the :each enumerator!" unless array_of_rows.respond_to?(:each)
    matcher    = FuzzyStringMatch::JaroWinkler.create()
    results    = []
    best_score = 0

    array_of_rows.each { |row|
# DEBUG
#      raise "row does not respond to '#{getter_for_comparison}'!" unless row.respond_to?( getter_for_comparison )
      comparison_string = row.send( getter_for_comparison )
      match_score = matcher.getDistance( matching_string.upcase, comparison_string.upcase )
      if ( (match_score > score_bias) && (best_score < match_score) )
# DEBUG
#        puts( "count_best_fuzzy_matches(): '#{matching_string}' vs. '#{comparison_string}' => score: #{match_score}" )
        results << { :score => match_score, :row => row }
      end
    }
    results.sort!{ |x,y| x[:score] <=> y[:score] }
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Uses #collect_best_fuzzy_matches() to iterate until it finds at least
  # a single possible match, provided it has a minimum result bias score.
  #
  # All matches found and collected are described inside the returned analysis
  # text string.
  # Matches are collected in FIFO order, with each one selected having a better
  # score than the previous one. The resulting array is sorted on score.
  #
  # If no match is found or if a definite action is not possible, a separate
  # SQL-executable text is also returned.
  #
  # === Parameters:
  # - matching_string: the name of the Team that must be seeked
  #
  # - desired_season_id: the season ID for which the Team is supposed to be
  #   affiliated with if the affiliation row is missing.
  #   (This is actually used only to generate SQL statements in the separated log)
  #
  # - analysis_text_log: the string holding the resulting analysis log
  #
  # - sql_text_log: the string holding the executable SQL stament log, which
  #   contains any suggested action to be executed next. (Which should only
  #   be executed after human check.)
  #
  # - starting_bias_score: the starting bias score for the search
  #
  # - ending_bias_score: the ending limit bias score for the search
  #
  # === Returns:
  # A #DataImportTeamAnalysisResult instance.
  #
  def self.analyze_team_name_best_matches( matching_string, desired_season_id,
                                           analysis_text_log, sql_text_log,
                                           starting_bias_score = 0.99,
                                           ending_bias_score = 0.8 )
    all_teams = Team.all
    result_hash1 = self.seek_minimum_bias_score_for(
      matching_string, all_teams, :name,
      starting_bias_score, ending_bias_score
    )
    all_affiliations = TeamAffiliation.all
    result_hash2 = self.seek_minimum_bias_score_for(
      matching_string, all_affiliations, :name,
      starting_bias_score, ending_bias_score
    )
                                                    # Collect result lists and min. bias:
    result_list = result_hash1[:result_list] + result_hash2[:result_list]
    min_bias_score = result_hash1[:updated_bias_score] < result_hash2[:updated_bias_score] ? result_hash1[:updated_bias_score] : result_hash2[:updated_bias_score]
                                                    # Prepare report:
    analysis_text_log << "\r\n-------------------------------------------------------------------------------------------------------------\r\n"
    analysis_text_log << "                    [[[ '#{matching_string}' ]]]  -- season_id: #{desired_season_id}, best-match search:\r\n\r\n"
    result_hash3 = self.prepare_analysis_report(
      matching_string, desired_season_id, analysis_text_log,
      result_list, min_bias_score
    )

    analysis_text_log = result_hash3[:analysis]
    team_match        = result_hash3[:team_match]        # (Not used yet)
    affiliation_match = result_hash3[:affiliation_match] # (Not used yet)
    hiscoring_match   = result_hash3[:hiscoring_match]   # (Not used yet)
    team_id           = result_hash3[:team_id]
    best_match        = result_hash3[:best_match]

    if team_id.to_i > 0                             # Let's be sure that there aren't really no affiliations with these parameters:     
      team_affiliation = TeamAffiliation.where(
        :team_id    => team_id,
        :season_id  => desired_season_id
      ).first
      if team_affiliation
        best_match = team_affiliation
        affiliation_match = team_affiliation
      end
    end

    # TODO This is not needed unless we want to store the uniq'ed list of results somewhere: (ALIAS table?)
                                                    # Re-sort the overall result list, clearing duplicates:
#    unique_name_list = result_list.collect{|e| e[:row].name }.uniq
#    overall_unique_list = unique_name_list.collect { |uniq_name| result_list.detect{|e| e[:row].name == uniq_name} }
#    overall_unique_list = overall_unique_list.sort!{ |x,y| x[:score] <=> y[:score] }

    if ( result_list.size < 1 )
      analysis_text_log << "   => NOT FOUND.\r\n"
    elsif ( result_list.size == 1 )
      analysis_text_log << "   --- SINGLE MATCH! ---\r\n"
    elsif ( result_list.size > 1 )
      analysis_text_log << "   --- MULTIPLE CHOICES ---\r\n"
    end
    # [Steve] OK, we could have a match. But we still need to solve how to import all
    # the data linked to a Team which seems to be existing, but under a slightly
    # different affiliation name.
    #
    # The solution is to create aliases to team_id(s) with the current searched name,
    # storing them in a dedicated table that gets checked during data-import on phase-1.
    #
    # The data_import_team_aliases table does just that, and is checked only during
    # the first phase of the data-import procedure.

    matching_string.gsub!("'", "''")              # Escape single quotes in names in case we have to write SQL statements:

    team_analysis_result = DataImportTeamAnalysisResult.new({
      analysis_log_text:  analysis_text_log,
      searched_team_name: matching_string,
      desired_season_id:  desired_season_id,
      chosen_team_id:     team_id,
      team_match_name:    ( team_match && team_match[:row] ? team_match[:row].name : nil ),
      team_match_score:   ( team_match ? team_match[:score] : nil ),
      best_match_name:    ( best_match && best_match[:row] ? best_match[:row].team_name : nil ),
      best_match_score:   ( best_match ? best_match[:score] : nil )
    })
                                                    # Store suggested SQL action into the external log:
    sql_text_log << team_analysis_result.rebuild_sql_text()
    team_analysis_result
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  private


  # Returns a formatted string containing the result row main values
  #
  def self.format_result_row( result_row, result_score )
    output = "(#{sprintf("%-16s", result_row.class.name)})" <<
             " '#{result_row.name}', score #{sprintf("%1.4f", result_score)}" <<
             ", ID: #{sprintf("%4s", result_row.id)}"
    output << ", season_id: #{sprintf("%4s", result_row.season_id)}" if result_row.respond_to?(:season_id)
    output << "\t=> Team ID: #{sprintf("%4s", result_row.team_id)}"  if result_row.respond_to?(:team_id)
    output << " >> 100% ! <<" if result_score >= 0.9999
    output
  end


  # Prepares the report of best-matches text given the result hash.
  #
  # === Returns:
  # An hash with the structure:
  #
  #    {
  #      :analysis          => analysis output text log.
  #
  #      :team_match        => match {:row, :score} from teams, for the highest-scoring
  #                            match from teams.
  #                            +nil+ when no existing team was found in the results or linked
  #                            to them.
  #
  #      :team_id           => commodity id from the row above or from affiliation's team
  #                            (may, in fact, not be the same, depending on the "best match").
  #                            +nil+ when no existing team was found in the results.
  #
  #      :affiliation_match => match {:row, :score} from affiliations, will store
  #                            the highest-scoring match, indipendently from season_id.
  #
  #      :hiscoring_match   => absolute highest scoring match, either from teams or affilations
  #                            (indipendently from season_id).
  #
  #      :best_match        => best match {:row, :score} from affiliations,
  #                            defined only if season_id is equal to the desired value.
  #    }
  #
  def self.prepare_analysis_report( matching_string, desired_season_id, analysis_text_log,
                                    result_list, min_bias_score )
    affiliation_match = nil
    team_match = nil
    team_id = nil
    best_match = nil
    hiscoring_match = nil                           # Overall hi-scoring result (either Team or TeamAff.)

    result_list = result_list.sort!{ |x,y| x[:score] <=> y[:score] }
    result_list.each { |result|
      analysis_text_log << "   - " << self.format_result_row( result[:row], result[:score] )
      
      if result[:row].instance_of?( Team )
        # We will store only the highest matches per class, while looping on the results:
        team_match = result if team_match.nil? || (team_match && team_match[:score] < result[:score])

      elsif result[:row].instance_of?( TeamAffiliation )
        if ( desired_season_id == result[:row].season_id )
          analysis_text_log << " (SEASON OK)"
          best_match = result
          # [Steve] Only affiliations with the desired_season_id are the best matches,
          # but we will update also the pointer to the affiliation & highest scoring match
          # if the best match has at least the same result score.
          affiliation_match = result if affiliation_match.nil? || (affiliation_match && affiliation_match[:score] <= result[:score])
          hiscoring_match = result if hiscoring_match.nil? || (hiscoring_match && hiscoring_match[:score] <= result[:score])
        end
        # We will store only the highest matches per class, while looping on the results:
        affiliation_match = result if affiliation_match.nil? || (affiliation_match && affiliation_match[:score] < result[:score])
      end
      hiscoring_match = result if hiscoring_match.nil? || (hiscoring_match && hiscoring_match[:score] < result[:score])
      analysis_text_log << "\r\n"
    }
                                                    # Couldn't find a Team in result, but found an affiliation? 
    if (best_match)                                 # (That is: look-alike affiliation name found, but linked to a too-different team name?)
      team_id = best_match[:row].team_id            # Always override the chosen team_id with the best match
      team_match = { :score => best_match[:score], :row => best_match[:row].team } if team_match.nil?
    elsif (team_match.nil? && best_match.nil? && affiliation_match)
      team_match = { :score => affiliation_match[:score], :row => affiliation_match[:row].team }
    end
                                                    # Result team_id not set yet?:
    team_id = team_match[:row].id if team_id.nil? && team_match && team_match[:row]

    if (result_list.size > 0)
      analysis_text_log << "\r\n   ==> #{result_list.size} results tot., min. bias: #{sprintf("%1.4f", min_bias_score)}\r\n"
    else
      analysis_text_log << "   (no results)\r\n"
    end

    if team_match
      analysis_text_log << "   Team   BEST...: " << self.format_result_row( team_match[:row], team_match[:score] )
      analysis_text_log << "\r\n"
    end
    if affiliation_match
      analysis_text_log << "   Affil. BEST...: " << self.format_result_row( affiliation_match[:row], affiliation_match[:score] )
      analysis_text_log << "\r\n"
    end
    if hiscoring_match
      analysis_text_log << "   Hi-scoring....: " << self.format_result_row( hiscoring_match[:row], hiscoring_match[:score] )
      analysis_text_log << "\r\n"
    end
    if best_match
      analysis_text_log << "   - Preferred - : " << self.format_result_row( best_match[:row], best_match[:score] )
      analysis_text_log << "\r\n"
    end
    analysis_text_log << "   Chosen team_id = #{team_id}, season_id = #{desired_season_id}\r\n" if team_id
    {
      :analysis   => analysis_text_log,
      :team_id    => team_id,
      :team_match => team_match,
      :affiliation_match => affiliation_match,
      :hiscoring_match   => hiscoring_match,
      :best_match => best_match
    }
  end
  # ---------------------------------------------------------------------------


  # Iterates on itself until at least a match is found or the minimum bias score is
  # reached.
  #
  # Returns both the updated bias score and the result list of best-matches in
  # a single hash.
  #
  def self.seek_minimum_bias_score_for( matching_string, array_of_rows, getter_for_comparison,
                                        bias_score, limit_bias_score )
    result_list = self.collect_best_fuzzy_matches(
      matching_string, array_of_rows, getter_for_comparison,
      bias_score
    )
    total_matches = result_list.size
                                                    # Search deeper using a more relaxed bias:
    if ( (total_matches < 1) && (bias_score > limit_bias_score) )
      result_hash = seek_minimum_bias_score_for(
          matching_string, array_of_rows, getter_for_comparison,
          bias_score - 0.01, limit_bias_score
      )
      bias_score = result_hash[:updated_bias_score]
      result_list = result_list + result_hash[:result_list]
    end
    {
      :updated_bias_score => bias_score,
      :result_list => result_list
    }
  end
  # ---------------------------------------------------------------------------
end
