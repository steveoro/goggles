# Be sure to restart your server when you modify this file.

# Cookie-based store is the default from Rails 4+
Rails.application.config.session_store :cookie_store, key: '_goggles_session'

# To include a DB-based session store in Rails 4+, add the
# 'activerecord-session_store' gem to the Gemfile.
#Rails.application.config.session_store :active_record_store, {
#  key: '_goggles_session',
#  expire_after: 1.hours
#}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Goggles::Application.config.session_store :active_record_store
