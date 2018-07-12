=begin

= SendDbDiffJob

  - Goggles framework vers.:  6.343
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

      # Scan all serialized row values and move them on a file to be sent via e-mail:
      app_parameter_rows.each do |app_parameter_row|
        if app_parameter_row.free_text_1.present?
          add_sql_diff_comment( "Remote editing recorded from actions by User ID #{ app_parameter_row.code - 100000 }" )
          sql_diff_text_log << app_parameter_row.free_text_1
          sql_diff_text_log << "\r\n"
          # Clear the DB field used for serialization of this user's actions:
          app_parameter_row.update( free_text_1: '' )
        end
      end

      # DB-diff text collected:
      if sql_diff_text_log.present?
        logger.info("Serialized DB-diff text collected. Saving...")
        output_dir = File.join( Rails.root, 'public', 'output' )
        file_name  = "#{ DateTime.now().strftime('%Y%m%d%H%M') }#{ Rails.env == 'production' ? 'dev' : 'prod' }_remote_edit.diff.sql"
        full_diff_pathname  = File.join( output_dir, file_name )
        base_filename       = File.basename( full_diff_pathname )
        # Save the text into a file & send it (but only in production mode)
        save_diff_file( full_diff_pathname )
        logger.info( "DB-diff file '#{ base_filename }' created." )
        if Rails.env == 'production' || Rails.env == 'development'
          logger.info( "Sending file..." )
          # Send the DB diff file to the SysOp
          AgexMailer.action_notify_mail(
            nil, # (no current_user)
             "Collected DB-diff",
            "Remote edit multi-action DB-diff file.\r\nThe attached log file must be saved & synchronized by a local Admin app instance.",
            base_filename,
            full_diff_pathname
          ).deliver
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
end