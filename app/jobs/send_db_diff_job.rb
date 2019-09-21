=begin

= SendDbDiffJob

  - Goggles framework vers.:  6.377
  - author: Steve A.

 Job dedicated to process & "consume" any DB data difference stored in dedicated rows
 inside app_parameters table.

 All app_parameters rows w/ ID >= 100000 are reserved for remote editing DB-diff
 storage inside their free_text_1 column, 1 row for each User ID (100000 + user.id).

 Each free_text_1 value is collected and a DB-diff text file is created or appended
 with each row text value. If the append is successfult, the DB row is cleared.

 The resulting stored SQL text is then sent by the Job as a plain text e-mail attachment.
 Residual text files created inside output folder will be removed once a day from the server
 by the dedicated cron job (which will also clear the sessions).

=end
class SendDbDiffJob < ApplicationJob
  include SqlConvertable

  queue_as :default


  # Performs the Job
  def perform(*args)
    app_parameter_rows = AppParameter.where('code > 100000')

    # Serialization rows found:
    if app_parameter_rows.count > 0
      reset_sql_diff_text_log()

      # Scan all serialized row values and move them on the SQL diff-text log member,
      # while collecting also user & TM data:
      team_managers_data = collect_db_diff_text_and_user_data( app_parameter_rows )

      # DB-diff text collected:
      if sql_diff_text_log.present?
        logger.info("Serialized DB-diff text collected.")
        # Deliver DB-diff file & notify TMs only when not it test environment:
        if Rails.env == 'production' || Rails.env == 'development'
          prepare_and_deliver_db_diff_file()
          prepare_and_deliver_update_notifications( team_managers_data )
        end
      # No serialized DB-diff text found:
      else
        logger.info("Job invoked but no DB-diff text found. Nothing to be done.")
      end

    # Serialization rows yet to be created:
    else
      logger.info("No DB-diff serialization rows found. Nothing to be done.")
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # While looping on AppParameter to collect all DB-diff text, collect also a list
  # of unique TMs with associated editors/users in order to notify the TMs of the
  # latest changes or updates made.
  #
  # === Params:
  #
  # - app_parameter_rows: the list of AppParameter rows selected for DB-diff extraction
  #
  #
  # == Returns:
  #
  # An Hash keyed by the user.id of each TM, having structure:
  #
  #     {
  #       TM.user1.id => {
  #           tm_user: TM.user1,
  #           users: [editor_user1, editor_user2, ...],
  #           urls:  [req_url1_1, req_url1_2, ..., req_url2_1, ...],
  #           description: remote_edit_type_description
  #       },
  #
  #       TM.user2.id => { ... } #, ...
  #     }
  #
  def collect_db_diff_text_and_user_data( app_parameter_rows )
    # Prepare a list of unique editor users and associated TM data:
    editor_users = []
    req_urls = []
    team_managers_data = {}

    # Scan all serialized row values and move them on a file to be sent via e-mail:
    app_parameter_rows.each do |app_parameter_row|
      if app_parameter_row.free_text_1.present?
        add_sql_diff_comment( "Remote editing recorded from actions by User ID #{ app_parameter_row.code - 100000 }" )
        sql_diff_text_log << app_parameter_row.free_text_1
        sql_diff_text_log << "\r\n"

        # Compile a list of unique users that have edited something remotely:
        user_from_code = User.find_by_id( app_parameter_row.code.to_i - 100000)
        if user_from_code && !editor_users.include?( user_from_code )
          editor_users << user_from_code
          # Compile a list of all the associated TMs:
          team_managers_users = begin
            user_from_code.swimmer.badges.last.team_managers.map(&:user)
          rescue
            []
          end
          # For each editor user there may be more than 1 team manager.
          # We need to get all possible TM.users in order to send email notifications
          # to all of them:
          team_managers_users.each do |tm_user|
            # TM already stored?
            if team_managers_data.has_key?( tm_user.id )
              team_managers_data[ tm_user.id ][:users] << user_from_code
              team_managers_data[ tm_user.id ][:description].to_s << ", #{ app_parameter_row.free_text_2 }"
              # Add the list of baseURIs to the current TM's and make it unique in each row:
              team_managers_data[ tm_user.id ][:urls] += app_parameter_row.free_text_3.to_s.split("\r\n")
              team_managers_data[ tm_user.id ][:urls].uniq!

            # New TM? Initialize hash data:
            else
              team_managers_data[ tm_user.id ] = {
                tm_user:      tm_user,
                users:        [ user_from_code ],
                urls:         app_parameter_row.free_text_3.to_s.split("\r\n"),
                description:  app_parameter_row.free_text_2.to_s
              }
            end
          end
        end

        # Clear the DB field used for serialization of this user's actions:
        app_parameter_row.update( free_text_1: '' )
        app_parameter_row.update( free_text_2: '' )
        app_parameter_row.update( free_text_3: '' )
      end
    end

    team_managers_data
  end
  #-- -------------------------------------------------------------------------
  #++


  # Save the DB-editing SQL text and deliver it to the Admin for remote storage.
  #
  def prepare_and_deliver_db_diff_file()
    logger.info("Saving DB-diff text...")
    output_dir = File.join( Rails.root, 'public', 'output' )
    file_name  = "#{ DateTime.now().strftime('%Y%m%d%H%M') }#{ Rails.env == 'production' ? 'dev' : 'prod' }_remote_edit.diff.sql"
    full_diff_pathname  = File.join( output_dir, file_name )
    base_filename       = File.basename( full_diff_pathname )
    # Save the text into a file & send it (but only in production mode)
    save_diff_file( full_diff_pathname )
    logger.info( "DB-diff file '#{ base_filename }' created." )

    # Send the DB diff file to the SysOp
    logger.info( "Sending file..." )
    AgexMailer.action_notify_mail(
      nil, # (no current_user)
       "Collected DB-diff",
      "Remote edit multi-action DB-diff file.\r\nThe attached log file must be saved & synchronized by a local Admin app instance.",
      base_filename,
      full_diff_pathname
    ).deliver
  end
  #-- -------------------------------------------------------------------------
  #++


  # Notify uniq team managers for each editor/found found while looping on AppParameter
  # to extract the DB-diff data.
  # This may deliver more than 1 email notification for each edit (depending on total
  # TeamManagers for each swimmer).
  #
  # === Params:
  #
  # - team_managers_data: Hash having structure:
  #     {
  #       TM.user1.id => {
  #           tm_user: TM.user1,
  #           users: [editor_user1, editor_user2, ...],
  #           urls:  [req_url1_1, req_url1_2, ..., req_url2_1, ...],
  #           description: remote_edit_type_description
  #       },
  #
  #       TM.user2.id => { ... } #, ...
  #     }
  #
  def prepare_and_deliver_update_notifications( team_managers_data )
    # DEBUG
    # puts "\r\n\r\n- team_managers_data:"
    # pp team_managers_data.inspect

    # Notify uniq team managers for each editor_user:
    team_managers_data.each do |tm_id, tm_data|
      dest_user = tm_data[:tm_user]
      # Filter self from list of editors:
      editors   = tm_data[:users].reject { |user| user.id == dest_user.id }
                                 .map { |user| user.swimmer.get_full_name }
                                 .uniq
      base_uris = tm_data[:urls].uniq
                                .map { |s| "<li><a href=\"#{ s }\">#{ s.split(/\/meeting_/).last }</a></li>" }
                                .join("\r\n")

      # If there are editors left, compile the newsletter mailer for the notification:
      if editors.size > 0
        logger.info( "Preparing notification for '#{ dest_user.email }'..." )
        subject   = I18n.t('newsletter_mailer.remote_edit.title', what: tm_data[:description])
        title     = I18n.t('newsletter_mailer.remote_edit.subject', what: tm_data[:description].downcase.camelcase)
        contents  = I18n.t(
          'newsletter_mailer.remote_edit.contents',
          user_names: editors.join(', '),
          base_uris:  base_uris
        )
        NewsletterMailer.custom_mail( dest_user, subject, title, contents ).deliver
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
