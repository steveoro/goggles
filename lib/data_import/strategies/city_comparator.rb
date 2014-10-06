# encoding: utf-8


=begin

= CityComparator

  - Goggles framework vers.:  4.00.545
  - author: Steve A.

 Generic strategy class dedicated to compare City names taking
 into account possible abbreviations and naming variations.

  As an instance, it memoizes the list of existing/known cities
  from the database, to speed-up any repeated search.

=end
class CityComparator

  attr_reader :known_cities, :known_data_import_cities


  # Creates a new instance.
  #
  def initialize()
    @known_cities = City.all
    @known_data_import_cities = DataImportCity.all
  end
  #-- -------------------------------------------------------------------------
  #++

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
    when /CORREGGIO/i
      "Correggio,Reggio Emilia"
    when /FERRARA|FERRARESI/i
      "Ferrara,Ferrara"
    when /FIDENZA/i
      "Fidenza,Parma,43036"
    when /FIRENZE/i
      "Firenze,Firenze"
    when /FORLI/i
      "Forli',Forli'"
    when /IMOLA/i
      "Imola,Imola"
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
    when /O(\s|\.|BER\s)?\s?FERR|REGGIANA|TRICOLORE|DINAMI/i
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
      "Prato,Firenze,59100"
    when /RAVENN/i
      "Ravenna,Ravenna"
    when /RICCIONE/i
      "Riccione,Rimini,47838"
    when /RIMINI/i
      "Rimini,Rimini"
    when /ROMA|ANIENE/i
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
  #-- -------------------------------------------------------------------------
  #++

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
  def self.get_token_array_from_city_member_name( full_city_name )
    arr_of_tokens = full_city_name.split( /[\'\,\s\.]/ )
    arr_of_tokens.delete_if do |el|
      # Add here more frequently used abbreviations:
      [ 'di','ne','nel','nell','del','dell','in',
        'su','sul','sull',
        'da','dal','dall','san','s','sant', ''
      ].include?(el.downcase)
    end
  end

  # Compare two city-related names (either city name, area or country),
  # using the normalization process from #get_token_array_from_city_member_name().
  #
  # Note that this name should only be used on City members or places names,
  # since rules for abbreviating persons' names do not apply in the same manner.
  #
  # === Returns
  # true if there seems to be a match, false otherwise.
  #
  def self.compare_city_member_strings( city_member_name_1, city_member_name_2 )
    normalized_array_1 = get_token_array_from_city_member_name( city_member_name_1 ).join(' ')
    normalized_array_2 = get_token_array_from_city_member_name( city_member_name_2 )
    reg = Regexp.new( normalized_array_2.join('\s.*'), Regexp::IGNORECASE ) if normalized_array_2.instance_of?(Array)
    match = ( normalized_array_1 =~ reg )
    ! match.nil?
  end
  #-- -------------------------------------------------------------------------
  #++

  # Strips a City or Area or Country name of common prefixes, abbreviations and
  # connections or grammar characters, in a sort of a "normalization process",
  # and checks to see if they may refer to the same City.
  #
  # === Returns
  # +true+ if the comparison "seems a match".
  #
  def self.seems_the_same( city_name_1,    city_name_2,
                           area_name_1,    area_name_2,
                           country_code_1, country_code_2 )
    ( compare_city_member_strings( city_name_1, city_name_2 ) &&
      compare_city_member_strings( area_name_1, area_name_2 ) &&
      (country_code_1.upcase == country_code_2.upcase)
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
