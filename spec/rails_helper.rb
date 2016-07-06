# [Steve] Test coverage integrated on CodeClimate, with local HTML-file reports
# (Remember to exclude /coverage sub-dir from git repo)
unless ENV["CI"]
  require "codeclimate-test-reporter"
  require 'simplecov'
  CodeClimate::TestReporter.start
  SimpleCov.start 'rails'
  puts "SimpleCov required and started."
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
require 'devise' # note: require 'devise' after require 'rspec/rails' (this allows to use devise test helpers)
require 'factory_girl_rails'
require 'capybara/rails'
require 'capybara/rspec'

# Add factories directly from core engine:
FactoryGirl.definition_file_paths << "#{ GogglesCore::Engine.root }/spec/factories"
FactoryGirl.reload

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Add support files directly from Core engine and then from current app:
Dir[GogglesCore::Engine.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include( Devise::TestHelpers, type: :controller )
  config.include( Devise::TestHelpers, type: :features )
  config.include( Devise::TestHelpers, type: :view )
  # [Steve, 20140226] Add other custom helpers.
  # (Use #include to access the methods at the instance level: inside examples.)
  # (Use #extend to access them at the class level: outside examples, as in "#before".)
  config.include( ControllerMacros, type: :controller )
  config.include( ControllerMacros, type: :features )

  config.extend( ControllerMacros, type: :controller )
  config.extend( CustomMatchers::Routing, type: :controller )

  # [Steve, 20140226] Configure FactoryGirl to work with RSpec without prefixing them with "FactoryGirl"
  config.include( FactoryGirl::Syntax::Methods )

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
