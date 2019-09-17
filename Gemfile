if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'

gem "actionview", "~> 5.1.6.2"    # Vulnerability fix
gem 'activerecord-session_store'  # Needed to include a DB-based session store in Rails 4+
gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
gem 'sprockets'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'execjs'
gem 'therubyracer', platforms: :ruby

gem 'bootstrap-kaminari-views'

gem 'font-awesome-rails' # [Steve, 20161005] Font Awesome is used by WiceGrid instead of the old icons
gem 'haml-rails', '~> 2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'json'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

gem 'acts_as_reportable'
gem "amistad", git: "https://github.com/fasar-sw/amistad", branch: "rails5"
# [Steve] ^^ Customized version. For Facebook-like friendship management
# XXX When using ssh key use the protocol below:
#gem "amistad", git: "git@github.com:fasar-sw/amistad", branch: "rails5"

gem 'cocoon'
gem 'country_select'

# For asynch db-diff reporting in micro-transactions:
gem 'daemons'
gem 'delayed_job_active_record' # XXX [Steve, 20160920] DO NOT USE SafeYAML. Too many issues w/ ActiveRecord, Guard & DelayedJob (See https://github.com/dtao/safe_yaml#known-issues).

# [Steve, 20130412] Custom Documatic version (used for Ooo exports):
# XXX When using ssh key use the protocol below:
#gem 'documatic', git: "git@github.com:fasar-sw/documatic"
gem 'documatic', git: "https://github.com/fasar-sw/documatic"
gem 'draper'
gem 'ffi', '~> 1.9.25' # [Steve, 20181221] *** Security update ***
gem 'generator'

# XXX When using ssh key use the protocol below:
#gem "goggles_core", git: "git@github.com:steveoro/goggles_core", branch: "rails5"
gem "goggles_core", git: "https://github.com/steveoro/goggles_core"

gem 'kaminari'
gem 'nokogiri'
gem 'prawn', '~> 2.1'
gem 'prawn-table'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rest-client' # For api/v1/meetings/download
gem 'rubyzip', '~> 1.2.2', require: 'zip/zip' # [Steve, 20181221] *** Security update ***
gem "simple-navigation" # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem 'simple-navigation-bootstrap'
gem 'simple_form'
gem 'zip'

group :development do
  gem "better_errors"
  gem 'binding_of_caller'
  # Although Capistrano + seed_dump are strictly development-related gems,
  # including them into the test environment also allows Semaphore CI to
  # perform automated deployment from a test build without changing the current
  # Rails environment.
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-faster-assets'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-shell'
  gem 'guard-spring'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

group :development, :test do
  gem 'bullet'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'                  # Adds dummy names & fixture generator
  gem 'letter_opener'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false # For style checking
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'cucumber-rails', require: false
  gem 'rails-controller-testing' # FIXME High-priority: remove usage of 'assigns' & 'render_template' in tests
  gem 'rails_best_practices'
  gem 'selenium-webdriver'                          # Full browser simulation => Capybara.current_driver = :selenium
  gem 'simplecov', require: false
  gem 'test-unit' # FIXME (Low-pri) This is required by Draper inside the core engine, probably due to some wrong setting:
  gem 'webdrivers'
  gem 'webmock'
end
