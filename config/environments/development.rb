Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  #
  # [Steve, 201609] eager_load required by Rails 5 config.
  # true for production ENVs & when using a pre-loader like Zeus.
  config.eager_load = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.perform_deliveries = true
  # Use this to disable delivery errors, and bad email addresses will be ignored:
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # XXX [Steve A.] WARNING: when uncommenting below both ":letter_opener" AND
  #     ":test" as delivery method, *** KEEP IN MIND THAT EACH NEW USER CREATED
  #     FROM THE CONSOLE OR BY THE SERVER WILL GENERATE AN OUTGOING NOTIFY EMAIL. ***
  #
  #     Thus, it's imperative to use either one of the two "fake" delivery methods
  #     (by leaving them uncommented) prior of running any rake tasks that may
  #     create lots of fake users.
  config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.delivery_method = :test
  # config.action_mailer.asset_host = "http://localhost:3000"

  # [Steve, 20130716] mailer options used by Devise
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Do not compress assets
  config.assets.compress = false

  # Use a different path for precompiling development assets:
  # (This is needed only if remote assets precompile is turned off)
  # config.assets.prefix = "/dev-assets"

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Allow 'better_errors' gem to output stack-trace on TRUSTED_IP (beyond localhost),
  # launching the Rails server as:
  #
  # > TRUSTED_IP=192.168.0.xyz rails s
  #
  BetterErrors::Middleware.allow_ip! ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']


  # ============================================================================
  # Bullet gem specific configuration:  [Steve A., 20181103]
  # ============================================================================
  # (see https://github.com/flyerhzm/bullet)
  config.after_initialize do
    Bullet.enable = true
    # Pop up a JavaScript alert in the browser:
    # Bullet.alert = true
    # Log to the Bullet log file (Rails.root/log/bullet.log):
    Bullet.bullet_logger = true
    # Log warnings to your browser's console.log:
    Bullet.console = true

    # Pop up Growl warnings if your system has Growl installed:
    # Bullet.growl = true

    # Send XMPP/Jabber notifications to the receiver indicated:
    # Bullet.xmpp = {
    #   account: 'bullets_account@jabber.org',
    #   password: 'bullets_password_for_jabber',
    #   receiver: 'your_account@jabber.org',
    #   show_online_status: true
    # }

    # Add warnings directly to the Rails log:
    Bullet.rails_logger = false

    # Add other notifications:
    # Bullet.honeybadger = true
    # Bullet.bugsnag = true
    # Bullet.airbrake = true
    # Bullet.rollbar = true
    # Bullet.sentry = true

    # Adds the details in the bottom left corner of the page:
    # Bullet.add_footer = true

    # Stacktrace inclusion / exclusions:
    # Bullet.stacktrace_includes = ['your_gem', 'your_middleware']
    Bullet.stacktrace_includes = ['goggles_core']
    # Bullet.stacktrace_excludes = [
    #   'their_gem',
    #   'their_middleware',
    #   ['my_file.rb', 'my_method'], ['my_file.rb', 16..20]
    # ]

    # Add Slack notifications:
    # Bullet.slack = {
    #   webhook_url: 'http://some.slack.url',
    #   channel: '#default',
    #   username: 'notifier'
    # }

    # Raise errors, useful for making your specs fail unless they have optimized queries:
    # (For this to work, all the configuration boilerplate must be invoked also on test environment)
    # Bullet.raise = true

    # --- Bullet detectors: ---
    # (Each of these settings defaults to true)
    # Detect N+1 queries:
    # Bullet.n_plus_one_query_enable     = false

    # Detect eager-loaded associations which are not used:
    # [Steve, 20181103] Disabled, because currently Bullet does not support stack traces for this checker
    Bullet.unused_eager_loading_enable = false

    # Detect unnecessary COUNT queries which could be avoided with a counter_cache:
    # Bullet.counter_cache_enable        = false
  end

end
