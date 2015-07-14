# encoding: utf-8
require 'common/validation_error_tools'


=begin

= V2::BadgeDuplicateChecker

  - Goggles framework vers.:  4.00.725
  - author: Steve A.

  Checker service class for Swimmers/Badges duplicates.

=end
class V2::BadgeDuplicateChecker
  include Singleton

  # Checks if the specified instance of Swimmer has more than 1 badge per Team/Season.
  # Checks also if the Swimmer and Season instances are valid.
  #
  # Returns +true+ if no problems are found, +false+ otherwise.
  #
  def self.is_ok?( swimmer, season )
    raise ArgumentError.new(
      "swimmer must be an instance of Swimmer!"
    ) unless swimmer.instance_of?( Swimmer )

    Swimmer.joins(:badges).where(
      'badges.season_id'  => season.id,
      'badges.swimmer_id' => swimmer.id
    ).group('swimmers.id').having('COUNT(badges.id) > 1').first.nil?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the list of Swimmer rows that have duplicate badges for the specified
  # +season+. (An empty list when none are found.)
  #
  # (Remember to use Swimmer#get_badges_array(season) to retrieve the badges.)
  #
  def self.get_swimmers_with_duplicates( season )
=begin
    Equivalent SQL check:

    select swimmers.id from swimmers join badges on swimmers.id = badges.swimmer_id
    where badges.season_id = season.id
    group by swimmers.id
    having count(badges.id) > 1
=end
    Swimmer.joins(:badges).where( 'badges.season_id' => season.id )
      .group('swimmers.id').having('COUNT(badges.id) > 1').to_a
  end
  #-- -------------------------------------------------------------------------
  #++
end
