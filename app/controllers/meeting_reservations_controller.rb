# encoding: utf-8
require 'common/format'
require 'wrappers/timing'
require 'meeting_event_reservation_matrix_creator'
require 'meeting_relay_reservation_matrix_creator'
require 'team_manager_validator'


=begin

= MeetingReservationsController

  - version:  6.030
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
    creator.call
    # Serialize creator.sql_diff_text_log in a dedicated log file:
    if creator.processed_rows > 0 || creator.total_errors > 0
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "create_reservations_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )

      serialize_and_deliver_diff_file( creator, "update reservations", full_sql_diff_path )
      # TODO Alternatively, make an asynch job that sends a whole batch of edits via mail

      # Signal also locally if any error occurred during setup:
      if creator.total_errors > 0
        flash[:error] = I18n.t('something_went_wrong')
      end
    end

    # Setup is done. Now get the list of reservations for each athlete:
    prepare_reservations_and_events( @meeting, @team_affiliation )
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
    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
    logger.debug "> #{params.inspect}"

    # XXX Sample POST output:
    # <ActionController::Parameters {"utf8"=>"✓",
    #   "authenticity_token"=>"me8I1u4U6BVas/C0ajcm+zvKrCKYsFxlClf49zEBPi4scAJHmqVH4iDY1u3l4CJEuqMHkouDGn54dK9j4KpyLQ==",
    #   "evr_1"=>"", "evr_2"=>"35\"10", "evrChecked_2"=>"1", "evr_3"=>"", "evr_4"=>"", "evr_5"=>"",
    #   "evr_6"=>"", "evr_7"=>"", "evr_8"=>"32\"04", "evrChecked_8"=>"1",
    #   "evr_9"=>"", "evr_10"=>"", "evr_11"=>"", "resNotes_1"=>"vengo in macchina",
    #   "commit"=>"Salva", "id"=>"16216", "controller"=>"meeting_reservations",
    #   "action"=>"update", "locale"=>"it"} permitted: false>

    # TODO Make the Updater class & call it
    # TODO Serialize creator.sql_diff_text_log in a dedicated log file
    # TODO Make an asynch job that sends the results via mail

    # Create the SQL diff file, and send it, when operated remotely:
    # output_dir = get_output_folder()
    # file_name = get_timestamped_env_filename( "update_reservations_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
    # full_sql_diff_path = File.join( output_dir, file_name )
    # serialize_and_deliver_diff_file( updater, "update reservations", full_sql_diff_path )
#
    # # Signal any error or a successful operation:
    # if batch_updater.total_errors > 0
      # flash[:error] = I18n.t('something_went_wrong')
    # else
      # flash[:info] = I18n.t('social.changes_saved')
    # end

    # We need the list of reservations for each athlete in order to remain in edit mode:
    # (At the end of the update we expect to remain in edit mode - no redirection should be necessary)
    redirect_to( meeting_reservations_edit_events_url(id: @meeting.id) )
#    prepare_reservations_and_events( @meeting, @team_affiliation )
#    render 'edit_events'
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits the matrix of _relay_ reservations for the selected meeting, for the
  # whole team of the currently logged-in user.
  #
  # See #edit_events for detailed info.
  #
  def edit_relays
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
    logger.debug "> #{params.inspect}"

    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # POSTs the update for the matrix of _relay_ reservations for the selected meeting,
  # for the whole team of the currently logged-in user.
  #
  # See #update_events for detailed info.
  #
  def update_relays
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
    logger.debug "> #{params.inspect}"

    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Collects the list of @meeting_reservations for each Swimmer and all the
  # associated @reservations_events.
  #
  # === Params:
  # - meeting: a valid instance of Meeting
  # - team_affiliation: a valid instance of TeamAffiliation (capable of attending the Meeting)
  #
  # === Prepares:
  # - @meeting_reservations: ActiveRelation object (list of reservations for each Swimmer of the Team)
  # - @reservations_events: Hash with the structure { <MeetingReservation.id> => <MeetingEventReservation row> }
  #
  def prepare_reservations_and_events( meeting, team_affiliation )
    @meeting_reservations = MeetingReservation.where(
      meeting_id: meeting.id,
      team_id: team_affiliation.team_id
    ).joins(:swimmer)
      .includes(:swimmer).order('swimmers.complete_name')

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

    # To be a valid team manager, a user must be enabled to manage the season
    # of the selected Meeting and the meeting must still be manageable:
    @is_valid_team_manager = TeamManagerValidator.can_manage?( current_user, @meeting ) &&
                             TeamManagerValidator.is_manageable?( @meeting )
    # (If the meeting is no more manageable each control of the page should be set
    # as read-only, even if the page is still accessible because of existing reservations)

    # Detect if there's a swimmer associated:
    set_swimmer_from_current_user

    unless ( @is_valid_team_manager || @swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    else
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
        enabled_badge = @swimmer.badges.includes(:team_affiliation)
          .find{|b| b.team_affiliation.season_id == @meeting.season_id }
        @team_affiliation = enabled_badge.team_affiliation
      end
      @team = @team_affiliation.team
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates the SQL diff file using an SqlConvertable-compatible instance (must respond
  # to #sql_diff_text_log) and sends the file via mail if the current environment
  # is in production mode.
  #
  def serialize_and_deliver_diff_file( sql_convertable, mail_title, full_diff_pathname )
    File.open( full_diff_pathname, 'w' ) { |f| f.puts sql_convertable.sql_diff_text_log }
    base_filename = File.basename( full_diff_pathname )
    logger.info( "\r\nLog file '#{ base_filename }' created" )
    if Rails.env == 'production'
      AgexMailer.action_notify_mail(
        current_user,
        mail_title,
        "User #{current_user} has edited remotely the reservations for his/hers team, meeting ID #{@meeting.id}.\r\nThe attached log file must be synchronized locally.",
        base_filename,
        full_sql_diff_path
      ).deliver
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
