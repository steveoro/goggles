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
gem 'dj_mon', :git => 'https://github.com/fasar-sw/dj_mon.git' # This version has more verbose exception reporting instead of YAML trace

gem 'country_select'
gem 'simple_form'
gem "cocoon"

group :development do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs (RSpec)
  gem "factory_girl_rails"
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs (RSpec)
  gem "factory_girl_rails", "~> 3.0"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
# gem 'rvm-capistrano'                              # [Steve, 20140113] DO NOT INSTALL rvm as root! It messes up production config!!
gem 'seed_dump', '~> 0.5.3'                         # [Steve, 20130926] Version greater than this one are ment only for Rails 4!!

# To use debugger
#gem 'ruby-debug'

