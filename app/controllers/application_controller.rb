# encoding: utf-8


=begin

= ApplicationController

  - version:  6.003
  - author:   Steve A.

  Main Application controller.
=end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Use a custom page for routing errors:
#  unless Rails.application.config.consider_all_requests_local
#    rescue_from ActionController::RoutingError,       with: -> { render_404  }
#    rescue_from ActionController::UnknownController,  with: -> { render_404  }
#    rescue_from ActiveRecord::RecordNotFound,         with: -> { render_404  }
#  end

  before_action :set_locale, :check_maintenance_mode
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Security note: controllers with no-CSRF protection must disable the Devise fallback,
  # see #49 for details.
#  acts_as_token_authentication_handler_for User

#    fallback: :none,
#    if: ->(controller) { controller.user_token_authenticable? }

  # FIXME Rails5: :authenticate_user! NOT DEFINED YET AT THIS LEVEL
  # [Steve, 20140409] Disabling the auth filters by default will allow us to choose
  # with increased granularity which controllers must be protected:
#  skip_before_action :authenticate_user_from_token!
#  skip_before_action :authenticate_user!


  # Set the default URL options:
  def default_url_options( options={} )
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end


  protected


  # Returns true if the current user is defined and the controller does:
  # - respond to JSON
  #
#  def user_token_authenticable?
#    # This ensure the token can be used only for JSON requests (you may want to enable it for XML too, for example)
#    return false unless request.format.json?
#    return false if tokenized_user_identifier.blank?

    # `nil` is still a falsy value, but I want a strictly boolean field here
#    tokenized_user.try(:token_authenticable?) || false
#  end


  # Devise 4+ "lazy" parameter sanitizer
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :description, :year_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_name, :last_name, :description, :year_of_birth])
  end
  #-- -------------------------------------------------------------------------
  #++


  # Sets the @meeting instance if params[:id] corresponds to a valid Meeting Id
  # Sets also the corresponding @calendar_row if available.
  # It clears to +nil+ the instances otherwise.
  #
  def set_meeting_from_id
    meeting_id = params[:id].to_i
    @meeting = meeting_id > 0 ? Meeting.find_by_id( meeting_id ) : nil
    @calendar_row = @meeting ? FinCalendar.find_by_meeting_id( @meeting.id ) : nil
  end


  # Sets a @team instance if params[:team_id] corresponds to a valid Team Id.
  # It clears to +nil+ the instance otherwise.
  #
  def set_team_from_team_id
    team_id = params[:team_id].to_i
    @team = team_id > 0 ? Team.find_by_id( team_id ) : nil
  end


  # Sets a @swimmer instance if params[:swimmer_id] corresponds to a valid Swimmer Id.
  # It clears to +nil+ the instance otherwise.
  #
  def set_swimmer_from_swimmer_id
    swimmer_id = params[:swimmer_id].to_i
    @swimmer = swimmer_id > 0 ? Swimmer.find_by_id( swimmer_id ) : nil
  end


  # Sets a @swimmer instance from the current_user if it has an associated Swimmer.
  # It doesn't do anything otherwise.
  #
  def set_swimmer_from_current_user
    @swimmer = current_user.swimmer if current_user && current_user.swimmer
  end
  #-- -------------------------------------------------------------------------
  #++


  # Render custom 404-error page
#  def render_404
#    respond_to do |format|
#      format.html { render template: 'exceptions/error_page', status: 404 }
#      format.all { render nothing: true, status: 404 }
#    end
#  end


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
      logger.error( msg )
      logger.error( error_description )
                                                    # Send a message to the developers anyway:
      begin
        AgexMailer.exception_mail( current_user, error_description, error_trace ).deliver
        logger.info("[*I*]- e-mail error report allegedly sent.")
      rescue
        logger.warn( '[W!]-- Unable to send out notification e-mail message, Mailer not responding or not configured properly yet.' )
      end
      logger.error( error_trace ) if verbose_trace
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the full pathname of the output folder, used to create internal LOG
  # and PDF files that may be downloaded by the user or sent directly via mail.
  #
  def get_output_folder
    File.join( Rails.root, 'public', 'output' )
  end


  # Returns a timestamped pseudo-unique filename given a base name to append to
  # the prefix.
  # The prefix contains both a fixed timestamp in the format 'YYYYmmddHHMM'
  # and an environmental code (either 'dev' or 'prod') set to the opposite of the
  # running Rails environment.
  # For instance, the resulting code is 'dev' when running in production and
  # 'prod' otherwise.
  # This is usually used to generate SQL diff files for synching between
  # 'dev' & 'prod' environments (thus a change generated in 'dev' requires a
  # diff file to be run on 'prod' and vice-versa).
  #
  def get_timestamped_env_filename( basename )
    timestamp = DateTime.now().strftime('%Y%m%d%H%M')
    env_code  = Rails.env == 'production' ? 'dev' : 'prod'
    "#{ timestamp }#{ env_code }_#{ basename }"
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


  # Returns the same specified Hash with any password-related field stripped away.
  def remove_passwords( params_hash )
    params_hash.delete_if { |key| ['password', 'password_confirmation'].include?(key.to_s) }
  end

  # Logs registration actions with sending an email notification.
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
  end
  #-- -------------------------------------------------------------------------
  #++

  # Checks if the App is in maintenance mode and redirects if the mode is enabled.
  def check_maintenance_mode()
    versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
    if versioning.a_bool?
      logger.info('--- MAINTENANCE MODE IS ON! ---')
      respond_to do |format|
        format.html do
          # Do just a redirect (avoid an infinite loop of redirections):
          redirect_to( controller: 'home', action: 'maintenance' ) unless (params[:controller] == 'home') && (params[:action] == 'maintenance')
        end
        format.json { render json: {maintenance: true} and return }
      end
    end
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
# TODO move a static WIP page to the front, removing all the rest
    FileUtils.mv( wd + '/lib/' + GogglesCore::AppConstants::WEB_APP + '_wip.rhtml',
                  wd + '/app/views/layouts/' + GogglesCore::AppConstants::WEB_APP + '.rhtml', :force => true )
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
