# encoding: utf-8

require 'fileutils'
require 'fuzzystringmatch'
require 'common/format'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.85.20131106
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
end
