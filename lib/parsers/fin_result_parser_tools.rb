# encoding: utf-8

require 'fileutils'
require 'common/format'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.83.20131105
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


  # Splits a Team or a Swimmer name into an array of tokens.
  #
  def self.get_token_array_from_name( full_name )
    arr_of_tokens = full_name.split(/[\'\,\s\.]/)
  end


  # Compare two names (either a team name or a swimmer name),
  # using the normalization process from #get_token_array_from_name().
  #
  # === Returns
  # The comparison score. 1 point for each token that "resembles"
  # a possible match. Higher the score, higher the possibility.
  #
  def self.compare_tokenized_strings( possibly_new_name, existing_name )
    possibly_new_normalized = FinResultParserTools.get_token_array_from_name( possibly_new_name )
    existing_normalized_arr = FinResultParserTools.get_token_array_from_name( existing_name )

    possible_matches = []
    possibly_new_normalized.each{ |token_new|
      is_a_match = existing_normalized_arr.any?{ |token_old|
        if ( token_old.size < token_new.size )
          shortest = token_old
          other    = token_new
        else
          shortest = token_new
          other    = token_old
        end
        ( other =~ Regexp.new("#{shortest}.*", Regexp::IGNORECASE) ) == 0
      }
      possible_matches << token_new if is_a_match
    }
    possible_matches.size
  end

  # Normalizes and compares a Club/Team name or a Swimmer name to a couple of alternative names.
  # (Specifically the actual registration name and its user-editable counterpart.)
  #
  # === Returns
  # The comparison score. 1 point for each token that "resembles"
  # a possible match. Higher the score, higher the possibility.
  #
  def self.seems_to_have_the_same_name( new_name, existing_name, alt_existing_name )
    compare_tokenized_strings( new_name, existing_name ) +
    compare_tokenized_strings( new_name, alt_existing_name )
  end
  # ---------------------------------------------------------------------------
end
