# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingReservationMatrixProcessor

 - Goggles framework vers.:  6.030
 - author: Steve A.

 Parent Strategy class used as common ancestor for the creator and updater classes
 working with the matrix of reservations for a specific meeting/team manager combination.

=end
class MeetingReservationMatrixProcessor
  include SqlConvertable

  attr_reader :meeting, :team_affiliation, :current_user,
              :processed_rows, :total_errors

  # Form DOM ID prefixes for header fields regarding a single (badge/meeting)
  # reservation. (These are for internal usage only).
  # These strings are followed by the actual reservation row ID as found
  # in the database.
  DOM_PRE_RES_NOT_COMING = "resNC_"
  DOM_PRE_RES_CONFIRMED  = "resCnf_"
  DOM_PRE_RES_NOTES      = "resNotes_"

  # Form DOM ID prefixes for detail row fields regarding an event reservation
  # (individual or relay). (These are for internal usage only).
  # These strings are followed by the actual event/relay reservation row ID as
  # found in the database.
  DOM_PRE_EVENT_TIMING   = "evr_"
  DOM_PRE_EVENT_CHECKED  = "evrChk_"
  DOM_PRE_RELAY_CHECKED  = "errChk_"
  DOM_PRE_RELAY_NOTES    = "errNotes_"
  #-- --------------------------------------------------------------------------
  #++


  # Creates a new creator instance, given:
  #
  # - a valid Meeting instance
  # - a valid TeamAffiliation instance
  # - the current_user (User) instance
  #
  def initialize( options )
    @meeting          = options[ :meeting ]
    @team_affiliation = options[ :team_affiliation ]
    @current_user     = options[ :current_user ]
    @total_errors     = 0
    @processed_rows   = 0
    create_sql_diff_header( "#{ self.class.name } recorded from actions by #{ @current_user }" )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Simply validates the stored parameters.
  # Returns +true+ in case of no errors, +false+ otherwise.
  #
  # ** TO BE OVERRIDDEN IN SIBLINGS WITH ACTUAL IMPLEMENTATION **
  #
  # == Typical override:
  #
  #    def call
  #      super
  #      return false unless (@total_errors == 0)
  #
  #      # [...Actual implementation follows...]
  #
  #    end
  #
  def call
    unless @meeting.instance_of?( Meeting ) &&
           @team_affiliation.instance_of?( TeamAffiliation ) &&
           @current_user.instance_of?( User )
      @total_errors = 1
      create_sql_diff_footer( "INVALID PARAMETERS! Exiting..." )
    end
    return (@total_errors == 0)
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns the expected row count for the execution of the creator class.
  #
  # The result is the expected total data area. The actual processed_rows
  # will be lesser than this only when some rows are skipped during creation
  # (either due to errors or because already existing).
  #
  def expected_rows_count
    # Use memoization to avoid requering.
    @memoized_expected_count ||= get_badges_list.count * (self.get_events_list.count + 1)
    # (The actual matrix is composed by badges x events event reservations.
    #  The additional column is the single list of tot. badges, 1 for each header
    #  badge reservation)
  end
  #-- --------------------------------------------------------------------------
  #++


  protected


  # Returns a list of (individual) MeetingEvents for the selected @meeting.
  # Returns an empty array in case of invalid parameter.
  #
  def get_events_list
    # Use memoization to avoid requering:
    @memoized_event_list ||= if @meeting.instance_of?( Meeting )
      @meeting.meeting_events.are_not_relays.all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns a list of Badges for the selected @team_affiliation
  # Returns an empty array in case of invalid parameter.
  #
  def get_badges_list
    # Use memoization to avoid requering:
    @memoized_badges_list ||= if @team_affiliation.instance_of?( TeamAffiliation )
      @team_affiliation.badges.all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
