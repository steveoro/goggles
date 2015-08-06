# encoding: utf-8

require_relative '../../../strategies/fuzzy_string_matcher'


=begin

= V3::CityComparator

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Generic strategy class dedicated to compare City names taking
 into account possible abbreviations and naming variations.

=end
class V3::CityComparator

  # Searches for existing matching city names, assuming the
  # specified "composed" name contains the name of target city.
  #
  # === Params:
  # - team_or_composed_name: a name allegedly containing the city name to be searched.
  # - entity: the entity to be used for the search; defaults to City.
  #
  # === Returns
  # The first matching entity instance or +nil+ when none are found.
  #
  def search_composed_name( team_or_composed_name, entity = City )
    raise ArgumentError.new("'entity' must be an ActiveRecord model responding to :name!") unless entity.new.kind_of?( ActiveRecord::Base ) && entity.new.respond_to?(:name)
# DEBUG
#    puts "\r\nCityComparator.search_composed_name( '#{team_or_composed_name}' )"
    tokens = self.class.get_token_array_from_city_member_name( team_or_composed_name )
    tokens = tokens.delete_if { |token| token =~ /csi|scuola|accadem|team|club|united|asd|nuot|swim|\d/i }
    first_token = tokens.first
    trimmed_name = tokens.join(' ')
# DEBUG
#    puts "first_token: '#{first_token}' (trimmed_name: '#{trimmed_name}')"
    result = nil
    possible_names = entity.where( ["name LIKE ?", "%#{first_token}%"] )
    if possible_names.size > 0
      matcher = FuzzyStringMatcher.new( possible_names, :name )
      bias_score, result_list = matcher.seek_deep_match( trimmed_name )
# DEBUG
#      puts "result_list: #{result_list.inspect}"
      result_hash = result_list.first
      result = result_hash[:row] if result_hash.instance_of?( Hash )
    end
    result
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
      [
        'from', 'to', 'the',
        'di','ne','nel','nell','del','dell','in',
        'su','sul','sull',
        'da','dal','dall','san','s','sant', ''
      ].include?(el.downcase)
    end
  end

  # Compare two city-related names (either city name, area or country),
  # using the normalization process from #get_token_array_from_city_member_name().
  #
  # The first name is matched against the second, translated as a Regexp.
  #
  # Note that this name should only be used on City members or places names,
  # since rules for abbreviating persons' names do not apply in the same manner.
  #
  # === Returns
  # true if there seems to be a match, false otherwise.
  #
  def self.compare_city_member_strings( city_member_name_1, city_member_name_2 )
    normalized_name_1  = get_token_array_from_city_member_name( city_member_name_1 ).join(' ')
    normalized_array_2 = get_token_array_from_city_member_name( city_member_name_2 )
    reg = Regexp.new( normalized_array_2.join('\s.*'), Regexp::IGNORECASE ) if normalized_array_2.instance_of?(Array)
    match = ( normalized_name_1 =~ reg )
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
