# Be sure to restart your server when you modify this file.

Goggles::Application.config.session_store :active_record_store, {
  key: '_goggles_session',
  expire_after: 1.hours
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Goggles::Application.config.session_store :active_record_store
