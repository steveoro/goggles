# encoding: utf-8


# == FinResultParserTools module
#
# Container dedicated to parsing tools for FIN Results files.
#
# FIN Results are swimming meeting result text files, written mostly in UTF-8 italian
# locale (since F.I.N. is the Italian Swimming Federation).
#
# All the RegExp used by this Parser class assume the file to be processed is compliant
# with the format used in these kind of files. 
#
module FinResultParserTools

  # Parses a text date extracted from a FIN result text file. 
  #
  def self.parse_meeting_date( text_token )
    date_num_idx = text_token =~ /\d\d((\/|-|\,)\d\d)*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}/ui
    month_idx    = text_token =~ /(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}/ui
    year_idx     = text_token =~ /\s\d{2,4}/ui

    day       = text_token[ date_num_idx .. date_num_idx+1 ].strip if date_num_idx
    month     = text_token[ month_idx .. month_idx+2 ].downcase if month_idx
    month_num = ['gen','feb','mar','apr','mag','giu','lug','ago','set','ott','nov','dic'].index( month )
    year      = text_token[ year_idx .. year_idx+4 ].strip if year_idx

    text_date = "#{year}-#{sprintf( "%#{2.2}i", month_num.to_i+1)}-#{day}"
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
  # ---------------------------------------------------------------------------
end
