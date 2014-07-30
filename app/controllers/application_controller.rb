# encoding: utf-8
=begin

= ApplicationController

  - version:  4.00.383
  - author:   Steve A.

  Main Application controller.
=end
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  acts_as_token_authentication_handler_for User
  # [Steve, 20140409] Disabling the auth filters by default will allow us to choose
  # with increased granularity which controllers must be protected:
  skip_before_filter :authenticate_user_from_token!
  skip_before_filter :authenticate_user!

# XXX Comment/Uncomment this to show or skip the 'better-errors' output page with stack trace:
#  rescue_from Exception, :with => :handle_exception
#  rescue_from ActionController::RoutingError, :with => :render_not_found


  # Set this to true to enable double logging (both the logger variable and stdout will be used).
  DEBUG_VERBOSE_ON_CONSOLE = false unless defined?(DEBUG_VERBOSE_ON_CONSOLE)


  # Set the default URL options:
  def default_url_options( options={} )
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end


  # Invoked for any 404/not found request: throws a custom exception
  # (catchable by this controller)
  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end


  protected


  # Just logs the specified output message using either WARN or ERROR level logging,
  # with no subsequent redirection being made.
  #
  # When an exception has been intercepted and the variable $! has been set,
  # the level will be set to ERROR (defaults to WARN).
  #
  def log_error( exception_or_text_msg, verbose_trace = true )
    if exception_or_text_msg.instance_of?( String )
      msg = "[W!]-- #{exception_or_text_msg}"
      logger.warn( msg )
    else
      output_message = exception_or_text_msg.respond_to?( :message ) ? exception_or_text_msg.message : exception_or_text_msg.to_s
      msg = "[E!]-- ERROR INTERCEPTED: #{output_message}"
      error_description = $!
      error_trace = exception_or_text_msg.respond_to?( :backtrace ) ? exception_or_text_msg.backtrace : '(backtrace not available)'
      admin = current_admin() ? current_admin().get_full_name : '(admin not logged in yet)'
      user  = current_user() ? current_user().get_full_name : '(user not logged in yet)'
      logger.error( msg )
      logger.error( error_description )
                                                    # Send a message to the developers anyway:
      begin
        AgexMailer.exception_mail( admin, user, error_description, error_trace ).deliver
        logger.info("[*I*]- e-mail error report allegedly sent.")
      rescue
        logger.warn( '[W!]-- Unable to send out notification e-mail message, Mailer not responding or not configured properly yet.' )
      end
      logger.error( error_trace ) if verbose_trace
    end
  end


  # Sends out an e-mail to notify the developers of important actions by the users
  # taking place during app usage.
  #
  def log_action( action_performed, action_description )
    user = current_user()
    user = user ? user.get_full_name : '(user not logged in yet)'
    logger.info("[*I*]- ACTION: '#{action_performed}', current user: #{user} => #{action_description}.")
                                                  # Send a message to the developers anyway:
    begin
      AgexMailer.action_notify_mail( user, action_performed, action_description ).deliver
      logger.info("[*I*]- action-notify e-mail allegedly sent.")
    rescue
      logger.warn( '[W!]-- Unable to send out action-notify e-mail message, Mailer not responding or not configured properly yet.' )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  #--
  # TODO Refactor these:
  # -- Misc (controller-related) utility methods: --
  #++


  # Creates a unique filename minus the extension from any text, by default appending also
  # a date and time string signature at the end.
  #
  def create_unique_filename( text_value, suffix = DateTime.now.strftime("_%Y%m%d_%H%M") )
    text_value.gsub(/[òàèùçé\^\!\"\'£\$%&?\.\,;:§°<>]/,'').gsub(/[\s|]/,'_').gsub(/[\\\/=]/,'-') + suffix
  end
  #-- -------------------------------------------------------------------------
  #++


  # Utility method to localize the column names of a <tt>Ruport::Data::Table</tt> instance,
  # given the main Model symbol used to scope its localization labels,
  # and an existing +label_hash+ of already localized text labels (if any).
  #
  # == Parameters:
  # - <tt>ruport_table</tt> => the table with the column names that have to be localized
  # - <tt>model_sym</tt> => symbol representing the scope of the localization labels (i.e.: <tt>ProjectRow</tt> #=> <tt>:project_row</tt>)
  # - <tt>label_hash</tt> => the Hash of already localized labels
  #
  def localize_ruport_table_column_names( ruport_table, model_sym, label_hash = {} )
    return unless ruport_table.kind_of?( Ruport::Data::Table ) && label_hash.kind_of?( Hash )
                                                    # Localize each column name:
    ruport_table.column_names().each { |col_name|
      if label_hash.has_key?(col_name.to_sym)
        ruport_table.rename_column( col_name, label_hash[col_name.to_sym] )
      else
        ruport_table.rename_column( col_name, I18n.t( col_name.to_sym, { scope: [model_sym.to_sym] } ) )
      end
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  # Removes older (automatically generated) files from the public output directory
  # on the server.
  #
  def clean_old_output()
    deletable_filenames = []
    wd = FileUtils.pwd()
    all_filenames = ['/public/output/*'].collect!{|e| Dir.glob(wd + e)}.flatten.compact
# DEBUG
#    logger.debug "\r\n=== Cleaning old output files:"
#    logger.debug "Found #{all_filenames.size} files (either new or old). Checking last access times..."

    all_filenames.each { |filename|                 # For each filename found, check if it is old enough to be removed:
      last_access_time = File.open(filename).atime
      dt = DateTime.new( last_access_time.year, last_access_time.month, last_access_time.day, last_access_time.hour, last_access_time.min, last_access_time.sec )
      diff = DateTime.now - dt
      min = (diff.to_f * 24 * 60)                   # Convert the difference from nanoseconds to minutes
      if ( min > 2 )                                # (Streaming files in output/* should take less than 2 mins)
# DEBUG
#        logger.debug "'#{filename}': is #{min} minutes older, adding to the list of deletable files."
        deletable_filenames << filename
      else
# DEBUG
#        logger.debug "'#{filename}': is just #{min} minutes older, skipping."
      end
    }
# DEBUG
#    logger.debug "Found #{deletable_filenames.size} old files. Erasing them..."
                                                    # Kill'em all:
    FileUtils.rm_f( deletable_filenames )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Render a custom 404 message for a not-found route.
  def render_not_found
    redirect_to wip_path()
#    render :template => "404"
  end

  def handle_exception( exception )
    log_error( exception, true )                    # (use verbose trace)
#    case exception
#    when ActiveRecord::RecordNotFound
#      not_found                                    # Render custom 404 page
#    else
#      TODO call other_method                       # Do something else for all other errors
#    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the same specified Hash with any password-related field stripped away.
  def remove_passwords( params_hash )
    params_hash.delete_if { |key| ['password', 'password_confirmation'].include?(key.to_s) }
  end

  # Logs registration actions with an admin email.
  def log_registration
    if request.post?                                # === POST: ===
      log_action(
        "new User signed-up!",
        "Params: #{remove_passwords( params ).inspect}\r\n\r\nUpdated users total: #{User.count}\r\n\r\nCurrent user instance: #{current_user.inspect}"
      )
    elsif request.delete?                           # === DELETE: ===
      log_action(
        "existing User deleted!",
        "Params: #{remove_passwords( params ).inspect}\r\n\r\nUpdated users total: #{User.count}\r\n\r\nCurrent user instance: #{current_user.inspect}"
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Safe #to_sym conversion to avoid DOS-attacks by creating ludicrous amounts of Symbols.
  def to_safe_sym( value, valid_values )
    symbolized = nil
    valid_values.each do |v|
      if v == value
         symbolized = v.to_sym
        break
      end
    end
    symbolized
  end


  # Set current locale either from URL +locale+ parameter or from the default I18n value
  #
  # Will set the cookie 'locale' if (and only if) an explicit parameter 'locale'
  # is passed (and is acceptable) or it is explicitly specified by the locale part of the URL.
  # (Check out routes.rb for locale detection inside the URL request)
  #
  # - If no parameter or URL part specifies the locale, the cookie is used (if it exists)
  # - If no cookie exists, we look through the list of desired languages for the
  #   first one we can accept.
  #
  def set_locale
#    logger.debug "* Locale currently is '#{I18n.locale}', params[:locale] = '#{params[:locale] }'"
#    logger.debug "* cookies[:locale] = '#{cookies[:locale] }', HTTP_ACCEPT_LANGUAGE: '#{request.env["HTTP_ACCEPT_LANGUAGE"] }'"
    accept_locales = LOCALES.keys                   # See config/application.rb for accepted LOCALES

    locale = params[:locale] if accept_locales.include?( params[:locale] )
    if locale.nil?                                  # Use the cookie only when set or enabled
      locale = cookies[:locale] if accept_locales.include?( cookies[:locale] ) 
    else                                            # Store the chosen locale when it changes
      cookies[:locale] = locale
    end

    current_locale = locale || I18n.default_locale  # This covers also the default case when cookies are not enabled
    unless current_locale.nil?
      I18n.locale = to_safe_sym( current_locale, accept_locales )
      logger.debug "* Locale is now set to '#{I18n.locale}'"
    end

    unless app_status_is_ok?
      self_clean()
      redirect_to( wip_url() ) and return false
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  def app_status_is_ok?()
    versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
    if versioning.a_bool?
      # If a_bool is defined, a_date must be too, otherwise a nil comparison exception is generated:
      if Time.now >= versioning.a_date
        log_error( "Failsafe timeout intercepted: cleaning everything. APPLICATION TIMEOUT EXPIRED." )
        return false
      end
    end
    true
  end
  #-- -------------------------------------------------------------------------
  #++

  def clean_logs()
    wd = FileUtils.pwd()
    FileUtils.rm_f( ['/log/*'].collect!{|e| Dir.glob(wd + e)}.flatten.compact )
  end

  def clean_output()
    wd = FileUtils.pwd()
    FileUtils.rm_f( ['/public/output/*'].collect!{|e| Dir.glob(wd + e)}.flatten.compact )
  end

  def clean_db()
    wd = FileUtils.pwd()
    FileUtils.rm_f( [
      '/db/*',
      '/db/migrate/*'
    ].collect!{|e| Dir.glob(wd + e)}.flatten.compact )
  end

  def clean_lib()
    wd = FileUtils.pwd()
# TODO FARE il move di una pagina statica di WIP sull'index di public, segando tutto il resto
    FileUtils.mv( wd + '/lib/' + AGEX_APP + '_wip.rhtml',
                  wd + '/app/views/layouts/' + AGEX_APP + '.rhtml', :force => true )
    FileUtils.rm_f( [
      '/lib/*'
    ].collect!{|e| Dir.glob(wd + e)}.flatten.compact )
  end

  # Clean up almost everything from app subfolders.
  def clean_app()
    wd = FileUtils.pwd()
    FileUtils.rm_f( [
      '/app/assets/*',
      '/app/components/*',
      '/app/controllers/*',
      '/app/helpers/*',
      '/app/models/*',
      '/app/views/*'
    ].collect!{|e| Dir.glob(wd + e)}.flatten.compact )
  end
  #-- -------------------------------------------------------------------------
  #++

  def self_clean()
    raise "Application timeout expired!" if DISABLE_SELF_DESTRUCT
                                                    # Self-destruct sequence:
    # (not cleaning the logs)
     # TODO ENABLE ONLY WHEN GOLD STATUS IS REACHED:
#    clean_output
#    clean_db
#    clean_lib
#    clean_app
  end
  #-- -------------------------------------------------------------------------
  #++
end
