# Accepted and defined locales
LOCALES = {'it' => 'it-IT', 'en' => 'en-US'}.freeze

I18n.enforce_available_locales = true

# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
#config.i18n.default_locale = :it
