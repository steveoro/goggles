# encoding: utf-8
require 'common/format'
require 'wrappers/timing'
require 'meeting_event_reservation_matrix_creator'
require 'meeting_relay_reservation_matrix_creator'
require 'team_manager_validator'
require 'reservations_csi_2_csv'


=begin

= MeetingReservationsController

  - version:  6.084
  - author:   Steve A.

=end
class MeetingReservationsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse parameters:
  before_action :verify_meeting_and_association


  # Edits the matrix of reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  #
  # If the user is a team manager, the whole matrix of rows is editable.
  #
  # If no reservation rows are found, a new (empty but serialized on DB) matrix
  # of events reservations is created, having a single MeetingReservationRow for
  # each possibile event of the chosen meeting, for each and every one if the swimmers
  # currently registered to the current user's team affiliation.
  #
  # This is a POST-only action due to the implied row insertions.
  # No row deletions are currently permitted. This action recreates the whole matrix
  # *only* if no rows are found.
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
    # The creator will set-up a matrix of rows that can be edited and then persisted
    # with the #update action
    creator = MeetingEventReservationMatrixCreator.new(
      meeting:          @meeting,
      team_affiliation: @team_affiliation,
      current_user:     current_user
    )

    # Launch the creator and send the diff file, if any:
    perform_matrix_creation( creator, current_user, 'event' )

    # Setup is done. Now we need to collect the lists of reservations for each athlete:
    prepare_meeting_reservations( @meeting, @team_affiliation )  # Collect the created list of badge reservations
    prepare_events_reservations( @meeting, @team_affiliation )   # collect the created matrix (badges x event rows) of event reservations
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits the matrix of _relay_ reservations for the selected meeting, for the
  # whole team of the currently logged-in user.
  #
  # See #edit_events for detailed info.
  #
  def edit_relays
    # The creator will set-up a matrix of rows that can be edited and then persisted
    # with the #update action
    creator = MeetingRelayReservationMatrixCreator.new(
      meeting:          @meeting,
      team_affiliation: @team_affiliation,
      current_user:     current_user
    )

    # Launch the creator and send the diff file, if any:
    perform_matrix_creation( creator, current_user, 'relay' )

    # Setup is done. Now we need to collect the lists of reservations for each athlete:
    prepare_meeting_reservations( @meeting, @team_affiliation )  # Collect the created list of badge reservations
    prepare_relays_reservations( @meeting, @team_affiliation )   # collect the created matrix (badges x relays rows) of relay reservations
  end
  #-- -------------------------------------------------------------------------
  #++


  # POSTs the update for the matrix of reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  #
  # Posting updates for non-existing rows will fail silently.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def update_events
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}#update_events -----"
#    logger.debug "> #{params.inspect}"
    # XXX Sample POST output:
    # <ActionController::Parameters {"utf8"=>"✓",
    #   "authenticity_token"=>"<auth_string_token>",
    #     "resNC_1"=>"false", "resCnf_1"=>"true", "chk_resCnf_1"=>"true", "evrChk_1"=>"false", "resNotes_1"=>"2 seats available",
    #     "evrChk_2"=>"true", "chk_evrChk_2"=>"true", "evrChk_3"=>"false", "evrChk_4"=>"true",
    #     "chk_evrChk_4"=>"true", "resNotes_1"=>"", "resNC_47"=>"true", "chk_resNC_47"=>"true",
    #     "resCnf_47"=>"false",
    #     # [...]
    #   "commit"=>"Save", "id"=>"16216", "controller"=>"meeting_reservations",
    #   "action"=>"update", "locale"=>"en"} permitted: false>

    perform_matrix_update( params, current_user )
    # At the end of the update we expect to remain in edit mode:
    redirect_to( meeting_reservations_edit_events_url(id: @meeting.id) )
  end
  #-- -------------------------------------------------------------------------
  #++


  # POSTs the update for the matrix of reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  #
  # Posting updates for non-existing rows will fail silently.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def update_relays
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}#update_relays -----"
#    logger.debug "> #{params.inspect}"

    perform_matrix_update( params, current_user )
    # At the end of the update we expect to remain in edit mode:
    redirect_to( meeting_reservations_edit_relays_url(id: @meeting.id) )
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

    @events.each do |event|
      # *** RELAYS ***
      if event.event_type.is_a_relay
        # TODO WE NEED A DIFFERENT LAYOUT FOR THE RELAYS
        @reservations_relays[ event.id ] = MeetingRelayReservation.where(
          meeting_event_id: event.id,
          is_doing_this:    true
        ).joins(:meeting_session, :meeting_event, :event_type, :swimmer)
          .includes(:meeting_session, :meeting_event, :event_type, :swimmer)
          .order('meeting_sessions.session_order, meeting_events.event_order')
          .to_a

      # *** EVENTS ***
      else
        @reservations_events[ event.id ] = MeetingEventReservation.where(
          meeting_event_id: event.id,
          is_doing_this:    true
        ).joins(:meeting_session, :meeting_event, :category_type, :gender_type, :event_type, :swimmer)
          .includes(:meeting_session, :meeting_event, :category_type, :gender_type, :event_type, :swimmer)
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
      team_id:       @team_affiliation.team_id,
      is_not_coming: false,
      swimmer_id:    all_swimmer_ids
    ).joins(:swimmer).includes(:swimmer)

# DEBUG
    # logger.debug "---------------"
    # logger.debug "@events:"
    # @events.each{ |ev| logger.debug ev.inspect }
    # logger.debug "---------------"
    # logger.debug "- available @meeting_reservations tot...: #{ @meeting_reservations.count }"
    # logger.debug "- available @reservations_events subarrays tot....: #{ @reservations_events.count }"
    # logger.debug "- available @reservations_relays subarrays tot....: #{ @reservations_relays.count }"
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

    if all_swimmer_ids.size < 1
      flash[:error] = I18n.t(:no_detail_to_process)
      redirect_to( meetings_current_path() ) and return
    end
                                                    # == OPTIONS setup + RENDERING phase ==
    base_filename = "#{I18n.t('meeting_reservation.event_sheet_basefilename')}_#{@meeting.code}"
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      report_title:         I18n.t('meeting_reservation.event_sheet_title'),
      meta_info_subject:    'passages collection model sheet printout',
      meta_info_keywords:   "Goggles, #{base_filename}'",
      meeting:              @meeting,
      team:                 @team_affiliation.team,
      events:               @events,
      meeting_reservations: @meeting_reservations,
      reservations_events:  @reservations_events,
      reservations_relays:  @reservations_relays
    }

    send_data(                                      # == Render layout & send data:
        PassagesCollectSheetLayout.render( options ),
        type: 'application/pdf',
        filename: filename
    )
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
    csi_2_csv = ReservationsCsi2Csv.new(@meeting)
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
      ).joins(:meeting_session, :meeting_event, :event_type, :swimmer)
        .includes(:meeting_session, :meeting_event, :event_type, :swimmer)
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
          swimmer_id: reservation.swimmer_id
      ).joins(:meeting_session, :meeting_event, :event_type)
        .includes(:meeting_session, :meeting_event, :event_type)
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
          swimmer_id: reservation.swimmer_id
      ).joins(:meeting_session, :meeting_event, :event_type)
        .includes(:meeting_session, :meeting_event, :event_type)
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


  # Calls the creator specified, then serializes the SQL diff file, whenever
  # any processed row or error exists.
  #
  def perform_matrix_creation( creator, current_user, entity_simple_description )
    creator.call
    # Serialize creator.sql_diff_text_log in a dedicated log file:
    if creator.processed_rows > 0 || creator.total_errors > 0
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "create_#{ entity_simple_description }_res_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )

      serialize_and_deliver_diff_file( creator, "create #{ entity_simple_description } RESERVATIONS", full_sql_diff_path )
      # TODO Alternatively, make an asynch job that sends a whole batch of edits via mail

      # Signal also locally if any error occurred during setup:
      if creator.total_errors > 0
        flash[:error] = I18n.t('meeting_reservation.error_during_creation')
      # Everything OK?
      # Only upon main reservation sheet creation, signal to each possible interested
      # user that now he/she may be able to use the newly reservation sheet:
      elsif (Rails.env == 'production') && (entity_simple_description != 'relay')
        team_swimmers = @team_affiliation.badges.map{ |badge| badge.swimmer_id }
        # Extract all the Team's gogglers:
        team_users = User.where("swimmer_id IN (?)", team_swimmers)
            .select(:id).map{ |user| user.id }
            .reject{ |e| e == current_user.id }
        # Get only the interested gogglers from the team:
        interested_users = @meeting.tags_by_user_list
            .map{ |tag| User.find(tag.remove('u').to_i) }
            .select{ |user| team_users.include?( user.id ) }
        interested_users.each do |user|
          NewsletterMailer.custom_mail(
            user,
            I18n.t("newsletter_mailer.new_reservations.subject"),
            I18n.t("newsletter_mailer.new_reservations.title"),
            I18n.t(
              "newsletter_mailer.new_reservations.contents",
              team_manager_name: current_user.get_full_name,
              meeting_name: @meeting.get_full_name,
              manage_url: meeting_reservations_edit_events_url(id: @meeting.id)
            )
          ).deliver
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Performs the update process given the parameters hash and the current user.
  # Works indipendently for both ind. events and relays (including badge reservations).
  #
  def perform_matrix_update( params, current_user )
    # The updater will parse the parameter and update the corresponding rows, while
    # creating an SQL diff text to be serialized for database synchronization:
    updater = MeetingReservationMatrixUpdater.new( params, current_user )
    updater.call

    # Serialize updater.sql_diff_text_log in a dedicated log file:
    if updater.processed_rows > 0 || updater.total_errors > 0
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "update_event_res_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )

      serialize_and_deliver_diff_file( updater, "update RESERVATIONS", full_sql_diff_path )
      # TODO Alternatively, make an asynch job that sends a whole batch of edits via mail

      # Signal also locally if any error occurred during setup:
      if updater.total_errors > 0
        flash[:error] = I18n.t('meeting_reservation.error_during_save')
      else
        flash[:info] = I18n.t('meeting_reservation.changes_saved')
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates the SQL diff file using an SqlConvertable-compatible instance (must respond
  # to #sql_diff_text_log) and sends the file via mail if the current environment
  # is in production mode.
  #
  def serialize_and_deliver_diff_file( sql_convertable, mail_title, full_diff_pathname )
    sql_convertable.save_diff_file( full_diff_pathname )
    base_filename = File.basename( full_diff_pathname )
    logger.info( "\r\nLog file '#{ base_filename }' created" )
    if Rails.env == 'production'
      # Send the DB diff file to the SysOp
      AgexMailer.action_notify_mail(
        current_user,
        mail_title,
        "User #{current_user} has edited remotely the reservations for his/hers team, meeting ID #{@meeting.id}.\r\nThe attached log file must be synchronized locally.",
        base_filename,
        full_diff_pathname
      ).deliver

      # Send an additional mail message to the related team manager users (except the current user):
      filtered_managers = @team_affiliation.team_managers.all.select{ |tm| tm.user_id != current_user.id }
      filtered_managers.each do |team_manager|
        NewsletterMailer.custom_mail(
          team_manager.user,
          I18n.t("newsletter_mailer.reservations.subject"),
          I18n.t("newsletter_mailer.reservations.title"),
          I18n.t(
            "newsletter_mailer.reservations.contents",
            user_name: current_user.get_full_name,
            meeting_name: @meeting.get_full_name,
            manage_url: meeting_reservations_edit_events_url(id: @meeting.id)
          )
        ).deliver
      end
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

    # Avoid creating useless new reservations for already closed meetings,
    # by redirecting elsewhere:
    if ( MeetingReservation.where( meeting_id: @meeting.id ).count == 0 ) &&
       ( @meeting.meeting_individual_results.count > 0 || @meeting.are_results_acquired? )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.meeting_already_closed')
      redirect_to( meetings_current_path() ) and return
    end

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
#      puts "\r\n--- @swimmer: #{ @swimmer.inspect }"
#      puts "--- @meeting: #{ @meeting.inspect }"

      enabled_badge = @swimmer.badges.includes(:team_affiliation)
        .find{|b| b.team_affiliation.season_id == @meeting.season_id }
      @team_affiliation = enabled_badge.team_affiliation
    end
    @team = @team_affiliation.team
  end
  #-- -------------------------------------------------------------------------
  #++
end
