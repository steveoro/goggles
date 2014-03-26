source 'http://rubygems.org'

gem 'rails', '~> 3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_datepicker'


# Mini HOW-TO:
# ============
# The following (needed by Rake and Rails local execution) is not compatible when
# deploying to CloudFoundry.
# So do this:
#
# - sudo gem install activerecord-mysql2-adapter
# - sudo gem install execjs 
# - sudo gem install therubyrhino
# - bundle package
# - bundle install
#
# - Normally develop locally the application
#
# - When gold status is reached, toggle in production.rb: (if using CloudFoundry or not an Apache server)
#     config.serve_static_assets = true
#
# - Pre-compile all assets with:
#    $> bundle exec rake assets:precompile
#
# - When ready, re-comment the following line and push/update the app
#   to CloudFoundry using vmc (after a "bundle package" + "bundle install")

gem 'therubyracer', :platforms => :ruby
# gem 'therubyrhino'

                                                    # [Steve, 20111216] Netzke:
gem 'netzke-core', '~> 0.7.7'			      #, :git => "git://github.com/skozlov/netzke-core.git"
gem 'netzke-basepack', '~> 0.7.7'		    #, :git => "git://github.com/skozlov/netzke-basepack.git"

gem 'i18n'                                          # [Steve, 20111216] Internationalization library

gem 'ruport', :git => 'https://github.com/ruport/ruport.git', :branch => 'ruby19-compat'
gem 'acts_as_reportable'
gem 'prawn', '~> 0.14'
                                                    # [Steve, 20130412] Custom Documatic version (used for Ooo exports):
gem 'documatic', :git => 'https://github.com/fasar-sw/documatic.git'

gem 'generator'

# To use uploads:
gem 'carrierwave'

gem 'rubyzip', :require => 'zip/zip'
gem 'zip'
                                                    # [Steve, 20130715] Goggles-specific:
gem 'devise'
gem 'devise-i18n'
gem 'rails_admin'
                                                    # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem "simple-navigation"
gem 'simple-navigation-bootstrap'

gem "fuzzy-string-match_pure"                       # [Steve, 20131106] Used for Team/Swimmer names comparison & existence checking

gem "wice_grid", '~> 3.3'
gem 'daemons'
gem 'delayed_job_active_record'
gem 'dj_mon', :git => 'https://github.com/fasar-sw/dj_mon.git'    # This version has more verbose exception reporting instead of YAML trace
gem 'amistad', :git => 'https://github.com/fasar-sw/amistad.git'  # [Steve] Customized version. For Facebook-like friendship management

gem 'country_select'
gem 'simple_form'
gem "cocoon"

gem 'draper', '~> 1.3'                              # [Steve] For Decorator pattern support
# Draper usage: "rails generate decorator Article" for existing models,
# or "rails generate resource Article" to scaffold a new resource;
# Single instance => Article.first.decorate
# Indirect => ArticleDecorator.decorate( OtherCompatibleModel.first )
# Collection => ArticleDecorator.decorate_collection( Article.all )

gem "mechanize"                                     # [Steve, 20140306] For web-crawling tasks
gem "rest-client"


group :development do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs
  gem "factory_girl_rails"
  gem 'guard'
  gem 'guard-rspec'
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs
  gem "factory_girl_rails"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'rhc'                                           # [Steve, 20140426] For deployment to OpenShift (RedHat)

# gem 'rvm-capistrano'                              # [Steve, 20140113] DO NOT INSTALL rvm as root! It messes up production config!!
gem 'seed_dump', '~> 0.5.3'                         # [Steve, 20130926] Version greater than this one are ment only for Rails 4!!

                                                    # [Steve, 20140312] Added these to build test coverage stats reports (open: /goggles/coverage/index.html)
gem 'simplecov', '~> 0.7.1', require: false, group: :test
gem "codeclimate-test-reporter", group: :test, require: nil # [Steve, 20140321] CI/Test coverage via local test run
# gem 'coveralls', require: false                   # [Steve, 20140312] Continuous Integration not avaible for Goggles, since the DB is still W.I.P. and requires running the dedicated task rake db:rebuild_from_scratch

# To use debugger
#gem 'ruby-debug'

