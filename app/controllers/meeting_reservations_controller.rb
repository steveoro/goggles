# encoding: utf-8
require 'common/format'
require 'wrappers/timing'
require 'team_manager_validator'
require 'reservations_csi_2_csv'


=begin

= MeetingReservationsController

  - version:  6.361
  - author:   Steve A.

=end
class MeetingReservationsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse parameters:
  before_action :verify_meeting_and_association

  before_action :redirect_to_show_if_meeting_closed, except: [:show, :printout_event_sheet, :export_csi_csv]


  # Edits the reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  # The method filters out any relay event in order to shorten the width of
  # the grid used to display the reservation cells.
  #
  # If the user is a team manager, the whole matrix of rows is editable,
  # indipendently if any reservations (either header or detail rows) are
  # currently existing.
  #
  # The method uses the API/v2/remote_edit controller (which, in turn, it uses the
  # dedicated MeetingReservationUpdater strategy) to handle all modifications
  # (any row creation, edit or deletion).
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def edit_events
    # meeting:          @meeting
    # team_affiliation: @team_affiliation
    # current_user:     current_user
    get_badges_list()
    get_events_list()
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits the reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  # The method filters out any individual event in order to shorten the width of
  # the grid used to display the reservation cells.
  #
  # If the user is a team manager, the whole matrix of rows is editable,
  # indipendently if any reservations (either header or detail rows) are
  # currently existing.
  #
  # The method uses the API/v2/remote_edit controller (which, in turn, it uses the
  # dedicated MeetingReservationUpdater strategy) to handle all modifications
  # (any row creation, edit or deletion).
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def edit_relays
    # meeting:          @meeting
    # team_affiliation: @team_affiliation
    # current_user:     current_user
    get_badges_list()
    get_events_list( :only_relays )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Shows the current matrix data for both _event_ and _relay_ reservations,
  # for the (currently) chseon meeting, team and logged-in user.
  #
  def show
    prepare_meeting_reservations( @meeting, @team_affiliation )  # Collect the created list of badge reservations
    if @meeting_reservations.count < 1
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end
    get_events_list()
    prepare_events_reservations( @meeting, @team_affiliation )   # collect the created matrix (badges x event rows) of event reservations
    prepare_relays_reservations( @meeting, @team_affiliation )   # collect the created matrix (badges x relays rows) of relay reservations
  end
  #-- -------------------------------------------------------------------------
  #++


  # Prepares the PDF print-out for the event and relay reservations for the current
  # meeting.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def printout_event_sheet()
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}#printout_event_sheet -----"
#    logger.debug "> #{params.inspect}"

    # Collect all events for this Meeting, respecting session and event order:
    @events = @meeting.meeting_events
        .joins(:meeting_session, :event_type)
        .includes(:meeting_session, :event_type)
        .order('meeting_sessions.session_order, event_order')
        .to_a

    # Collect all available event (both ind. and relays) reservations:
    @reservations_events = {}
    @reservations_relays = {}
# DEBUG
#    puts "\r\n#- printout_event_sheet: Team: #{ @team.id }, meeting: #{ @meeting.id }, TA: #{ @team_affiliation.id }"

    @events.each do |event|
      # *** RELAYS ***
      if event.event_type.is_a_relay
        # TODO WE NEED A DIFFERENT LAYOUT FOR THE RELAYS
        @reservations_relays[ event.id ] = MeetingRelayReservation.where(
          meeting_event_id: event.id,
          team_id: @team.id,
          is_doing_this:    true
        ).joins(:swimmer, meeting_event: [:meeting_session, :event_type])
          .includes(:swimmer, meeting_event: [:meeting_session, :event_type])
          .order('meeting_sessions.session_order, meeting_events.event_order')
          .to_a
      # *** EVENTS ***
      else
        @reservations_events[ event.id ] = MeetingEventReservation.where(
          meeting_event_id: event.id,
          team_id: @team.id,
          is_doing_this:    true
        ).joins(:category_type, swimmer: [:gender_type], meeting_event: [:meeting_session, :event_type])
          .includes(:category_type, swimmer: [:gender_type], meeting_event: [:meeting_session, :event_type])
          .order('meeting_sessions.session_order, meeting_events.event_order, category_types.code, gender_types.code')
          .to_a
      end
    end

    # Collect all related swimmer reservations (to gather also notes):
    all_swimmer_ids = ( @reservations_events.values + @reservations_relays.values )
      .flatten
      .map{ |res| res.swimmer_id }
      .uniq
    @meeting_reservations = MeetingReservation.where(
      meeting_id:    @meeting.id,
      team_id:       @team_affiliation ? @team_affiliation.team_id : @team.id,
      is_not_coming: false,
      swimmer_id:    all_swimmer_ids
    ).joins(:swimmer).includes(:swimmer)

# DEBUG
    # puts "---------------"
    # puts "all_swimmer_ids: #{ all_swimmer_ids.inspect }"
    # puts "@events:"
    # @events.each{ |ev| puts ev.inspect }
    # puts "---------------"
    # puts "- available @meeting_reservations tot...: #{ @meeting_reservations.count }"
    # puts "- available @reservations_events subarrays tot....: #{ @reservations_events.count }"
    # puts "- available @reservations_relays subarrays tot....: #{ @reservations_relays.count }"
    # logger.debug "---------------"
    # logger.debug "@meeting_reservations:"
    # @meeting_reservations.each{ |r| logger.debug r.inspect }
    # logger.debug "---------------"
    # logger.debug "@reservations_events hash:"
    # @reservations_events.values.each_with_index do |re, idx|
      # logger.debug( "\r\nEvent #{idx+1}, tot.: #{re.count}" )
      # logger.debug( re.inspect )
    # end
    # logger.debug "---------------"
    # logger.debug "@reservations_relays hash:"
    # @reservations_relays.values.each_with_index do |re, idx|
      # logger.debug( "\r\nEvent #{idx+1}, tot.: #{re.count}" )
      # logger.debug( re.inspect )
    # end
    # logger.debug "---------------"

    # Prepare the printout only if there's actually someone going to this Meeting:
    # (No redirect if there's no data)
    if all_swimmer_ids.size > 0
                                                    # == OPTIONS setup + RENDERING phase ==
      base_filename = "#{I18n.t('meeting_reservation.event_sheet_basefilename')}_#{@meeting.code}"
      filename = create_unique_filename( base_filename ) + '.pdf'
      options = {
        report_title:         I18n.t('meeting_reservation.event_sheet_title'),
        meta_info_subject:    'passages collection model sheet printout',
        meta_info_keywords:   "Goggles, #{base_filename}'",
        meeting:              @meeting,
        team:                 @team,
        events:               @events,
        meeting_reservations: @meeting_reservations,
        reservations_events:  @reservations_events,
        reservations_relays:  @reservations_relays
      }

      send_data(                                    # == Render layout & send data:
          PassagesCollectSheetLayout.render( options ),
          type: 'application/pdf',
          filename: filename
      )

    # XXX [Steve, 20180704] Use-case example that forces a redirect during PDF printout of the event sheet:
    #     TeamManager #9 (Simone DelRio) w/ Meeting ID 16106 (for example), w/ 0 MER reserved rows.
    else
      flash[:error] = I18n.t(:no_detail_to_process)
      redirect_to( meetings_current_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Collects the reservation data for the specified Meeting ID and outputs a
  # custom CSV text file, used as exchange data format in between C.S.I. regional organizations.
  #
  # This is a Team-manager restricted action.
  #
  def export_csi_csv
    unless TeamManagerValidator.can_manage?( current_user, @meeting )
      flash[:error] = I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    end
    unless ReservationsCsi2Csv.is_a_csi_meeting( @meeting )
      flash[:error] = I18n.t('meeting_reservation.export_csi_csv_invalid_meeting_error')
      redirect_to( meetings_current_path() ) and return
    end
    csi_2_csv = ReservationsCsi2Csv.new( @meeting, @team )
    csi_2_csv.collect()

    if csi_2_csv.csi_data_rows.size < 1
      flash[:warning] = I18n.t('meeting_reservation.export_csi_csv_no_reservations_found_error')
      redirect_to( meetings_current_path() ) and return
    end

    send_data(                                      # == Send the collected data:
        csi_2_csv.output_text,
        type: 'text/csv',
        filename: @meeting.get_data_import_file_name('isc', 'csv')
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # GET + POST relay auto-configurator.
  #
  # GET: analyze and suggest the best relay(s) configuration depending upon the
  # current relay availability of each reserved swimmer.
  #
  # POST: accepts and updates the relay reservations, according to the suggested changes.
  #
  # See #edit_relays and #update_relays for more info.
  #
  def relayometer
    unless @is_valid_team_manager
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    end
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}#relayometer -----"
#    logger.debug "> #{params.inspect}"

    # Collect all relay events for this Meeting, respecting session and event order:
    @events = @meeting.meeting_events
        .joins(:meeting_session, :event_type)
        .includes(:meeting_session, :event_type)
        .where('event_types.is_a_relay = 1')
        .order('meeting_sessions.session_order, event_order')
        .to_a
    # Collect the availability matrix (badges x relays rows) of relay reservations:
    @reservations_relays = {}
    @events.each do |event|
      @reservations_relays[ event.id ] = MeetingRelayReservation.where(
        meeting_event_id: event.id,
        is_doing_this:    true
      ).joins(:swimmer, meeting_event: [:meeting_session, :event_type])
        .includes(:swimmer, meeting_event: [:meeting_session, :event_type])
        .order('meeting_sessions.session_order, meeting_events.event_order')
        .to_a
    end

    # POST: Parse the chosen config changes from the POST parameters and apply them on the reservations:
    if request.post?
      # TODO / WIP

    # GET: Analyze current relay availability and propose some solutions:
    else
      # TODO / WIP
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a list of (individual) MeetingEvents for the selected @meeting.
  # Possible +:which_type+ values: [<:are_not_relays>|:only_relays]
  #
  # Returns an empty array in case of invalid parameter.
  # Sets the internal member @event_list.
  #
  def get_events_list( which_type = :are_not_relays )
    # Use memoization to avoid requering:
    @event_list ||= if @meeting.instance_of?( Meeting )
      @meeting.meeting_events.send( which_type.to_sym )
        .joins(:meeting_session, :event_type)
        .includes(:meeting_session, :event_type)
        .order('meeting_sessions.session_order, meeting_events.event_order')
        .all
    else
      []
    end
  end


  # Returns a list of Badges for the selected @team_affiliation
  # Returns an empty array in case of invalid parameter.
  # Sets the internal member @badges_list.
  #
  def get_badges_list
    # Use memoization to avoid requering:
    @badges_list ||= if @team_affiliation.instance_of?( TeamAffiliation )
      @team_affiliation.badges.sort_by_swimmer('ASC').all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Collects the list of @meeting_reservations for each Swimmer, given the specified
  # meeting and team_affiliation.
  #
  # === Params:
  # - meeting: a valid instance of Meeting
  # - team_affiliation: a valid instance of TeamAffiliation (capable of attending the Meeting)
  #
  # === Prepares:
  # - @meeting_reservations: ActiveRelation object (list of reservations for each Swimmer of the Team)
  #
  def prepare_meeting_reservations( meeting, team_affiliation )
    @meeting_reservations = MeetingReservation.where(
      meeting_id: meeting.id,
      team_id: team_affiliation.team_id
    ).joins(:swimmer).includes(:swimmer).order('swimmers.complete_name')
  end


  # Collects the list of @reservations_events associated to the specified meeting
  # and team_affiliation.
  #
  # Assumes @meeting_reservations is already filled with a list of MeetingReservation rows.
  #
  # === Params:
  # - meeting: a valid instance of Meeting
  # - team_affiliation: a valid instance of TeamAffiliation (capable of attending the Meeting)
  #
  # === Prepares:
  # - @reservations_events: Hash with the structure { <MeetingReservation.id> => <MeetingEventReservation row> }
  #
  def prepare_events_reservations( meeting, team_affiliation )
    # Get the list of rows of event reservations for each athlete:
    @reservations_events = {}
    @meeting_reservations.each do |reservation|
      @reservations_events[ reservation.id ] = MeetingEventReservation.where(
          meeting_id: meeting.id,
          team_id: team_affiliation.team_id,
          swimmer_id: reservation.swimmer_id
      ).joins(meeting_event: [:meeting_session, :event_type])
        .includes(meeting_event: [:meeting_session, :event_type])
        .order('meeting_sessions.session_order, meeting_events.event_order')
        .to_a
      # Assuming 'mer' is an item of the resulting array, this yields something
      # like:
      #       mer.event_type.i18n_short             for the event description
      #       mer.meeting_session.scheduled_date    for the scheduled date
    end
  end


  # Collects the list of @reservations_relays associated to the specified meeting
  # and team_affiliation.
  #
  # Assumes @meeting_reservations is already filled with a list of MeetingReservation rows.
  #
  # === Params:
  # - meeting: a valid instance of Meeting
  # - team_affiliation: a valid instance of TeamAffiliation (capable of attending the Meeting)
  #
  # === Prepares:
  # - @reservations_relays Hash with the structure { <MeetingReservation.id> => <MeetingRelayReservation row> }
  #
  def prepare_relays_reservations( meeting, team_affiliation )
    # Get the list of rows of relay reservations for each athlete:
    @reservations_relays = {}
    @meeting_reservations.each do |reservation|
      @reservations_relays[ reservation.id ] = MeetingRelayReservation.where(
          meeting_id: meeting.id,
          team_id: team_affiliation.team_id,
          swimmer_id: reservation.swimmer_id
      ).joins(meeting_event: [:meeting_session, :event_type])
        .includes(meeting_event: [:meeting_session, :event_type])
        .order('meeting_sessions.session_order, meeting_events.event_order')
        .to_a
      # Assuming 'mrr' is an item of the resulting array, this yields something
      # like:
      #       mrr.event_type.i18n_short             for the event description
      #       mrr.meeting_session.scheduled_date    for the scheduled date
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Verifies that a meeting id is provided as parameter and that the current user
  # is either associated to a swimmer or is the team_manager of a team.
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @meeting, a valid Meeting instance
  # - @is_valid_team_manager, either +true+ or +false+
  # - @swimmer, +nil+ only when no associated swimmer was found (allegedly, in this case @is_valid_team_manager should result true)
  # - @team_affiliation, a valid TeamAffiliation instance
  # - @team, a valid Team instance
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #
  def verify_meeting_and_association
    set_meeting_from_id
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_meeting_id')
      redirect_to( meetings_current_path() ) and return
    end

    # To be a valid team manager (precisely, for editing & adding reservations),
    # a user must be:
    # - enabled to manage the season of the selected Meeting (...AND...)
    # - the meeting must still be 'reservation-manageable'
    @is_valid_team_manager = TeamManagerValidator.can_manage?( current_user, @meeting ) &&
                             TeamManagerValidator.is_reservation_manageable?( @meeting )
    # (If the meeting is no more 'reservation-manageable', each view page widget
    #  should be set as read-only, even if the page is still accessible because
    #  of existing reservations.)

    # Detect if there's a swimmer associated:
    set_swimmer_from_current_user

    # Bail out unless the user is a valid team manager, or if a swimmer is checking
    # a meeting w/ reservations that do not belong to him/her:
    unless ( @is_valid_team_manager ||
             ( @swimmer && TeamManagerValidator.any_reservations_for?(current_user, @meeting) )
           )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    end

    # FIXME [Steve, 20161213] It could be possible to have a user that is defined as TeamManager
    #       (for example, for ease of passages editing) for a couple of TeamAffiliations
    #       both registered to the same season and thus eligible to manage the registrations
    #       of different teams for the same meeting, while (for referential integrity) the
    #       badge associated to the swimmer of the TeamManager allows him/her to take
    #       part in the same meeting with only one affiliation.
    #
    #       This is possibile because Team Managers are defined freely according
    #       to user requests.
    #
    #       THIS MUSt BE HANDLED BY THE QUERY BELOW AND ALL THE SWIMMERS FOR
    #       ALL INVOLVED TEAMAFFILIATIONS SHOULD BE COLLECTED!
    if @is_valid_team_manager
      enabled_manager = current_user.team_managers.includes(:team_affiliation)
        .find{|tm| tm.team_affiliation.season_id == @meeting.season_id }
      @team_affiliation = enabled_manager.team_affiliation
    else
# DEBUG
#      puts "\r\n=> verify_meeting_and_association()\r\n--- @swimmer: #{ @swimmer.inspect }"
#      puts "--- @meeting: #{ @meeting.inspect }"

      enabled_badge = @swimmer.badges.includes(:team_affiliation)
        .find{|b| b.team_affiliation.season_id == @meeting.season_id }
      @team_affiliation = enabled_badge.team_affiliation
    end
    @team = @team_affiliation.team
  end
  #-- -------------------------------------------------------------------------
  #++


  # Redirects to #show if the current meeting has already any results acquired.
  # This is used to skip the useless creation of any additional reservation row
  # for already acquired/consolidated meetings.
  #
  def redirect_to_show_if_meeting_closed
    # Avoid creating useless new reservations for already closed meetings,
    # by redirecting to #show:
    if ( @meeting.meeting_individual_results.exists? || @meeting.are_results_acquired? )
      flash[:error] = I18n.t('meeting.errors.meeting_already_closed')
      redirect_to( meeting_reservations_show_path( id: @meeting.id ) ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
