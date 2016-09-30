Goggles::Application.configure do
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
  config.eager_load = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
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
  config.action_mailer.default_url_options = { host: 'localhost' }

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
  config.assets.prefix = "/dev-assets"

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Allow 'better_errors' gem to output stack-trace on TRUSTED_IP (beyond localhost),
  # launching the Rails server as:
  #
  # > TRUSTED_IP=192.168.0.xyz rails s
  #
  BetterErrors::Middleware.allow_ip! ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']
end
