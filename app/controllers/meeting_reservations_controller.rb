# encoding: utf-8
require 'common/format'
require 'wrappers/timing'


=begin

= MeetingReservationsController

  - version:  6.015
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
  def edit
    creator = MeetingReservationMatrixCreator.new(
      meeting:          @meeting,
      team_affiliation: @team_affiliation,
      current_user:     current_user
    )
    creator.call
    # Serialize creator.sql_diff_text_log in a dedicated log file:
    if creator.created_rows_count > 0 || creator.total_errors > 0
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "create_reservations_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )

      serialize_and_deliver_diff_file( creator, "update reservations", full_sql_diff_path )
      # TODO Alernatively, make an asynch job that sends a whole batch of edits via mail

      # Signal also locally any error or a successful operation:
      if creator.total_errors > 0
        flash[:error] = I18n.t('something_went_wrong')
      else
        flash[:info] = I18n.t('social.changes_saved')
      end

      # (At the end we expect to remain in edit mode - no redirection should be necessary)
    end
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
  def update
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

    # (At the end we expect to remain in edit mode - no redirection should be necessary)
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that a meeting id is provided as parameter and that the current user
  # is either associated to a swimmer or is the team_manager of a team.
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @meeting, a valid Meeting instance
  # - @is_valid_team_manager, either +true+ or +false+
  # - @swimmer, +nil+ only when no associated swimmer was found (allegedly, in this case @is_valid_team_manager should result true)
  # - @team_affiliation, a valid TeamAffiliation instance
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #
  def verify_meeting_and_association
    meeting_id = params[:id].to_i
    @meeting = Meeting.find_by_id( meeting_id )
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_meeting_id')
      redirect_to( meetings_current_path() ) and return
    end

    # To be a valid team manager, a user must be enabled to manage the season
    # of the selected Meeting:
    @is_valid_team_manager = current_user &&
              (current_user.team_managers.count > 0) &&
              (! current_user.team_managers.find{|tm| tm.team_affiliation.season_id == @meeting.season_id }.nil?)

    # Detect if there's a swimmer associated:
    @swimmer = current_user.swimmer

    unless ( @is_valid_team_manager || @swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    else
      if @is_valid_team_manager
        enabled_manager = current_user.team_managers.includes(:team_affiliation)
          .find{|tm| tm.team_affiliation.season_id == @meeting.season_id }
        @team_affiliation = enabled_manager.team_affiliation
      else
        enabled_badge = @swimmer.badges.includes(:team_affiliation)
          .find{|b| b.team_affiliation.season_id == @meeting.season_id }
        @team_affiliation = enabled_badge.team_affiliation
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
