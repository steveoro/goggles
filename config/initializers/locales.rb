# Accepted and defined locales
LOCALES = {'it' => 'it-IT', 'en' => 'en-US'}.freeze

I18n.enforce_available_locales = true

# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

# [Steve, 20170105] Since too many old tests rely on the old default locale for the
# default URL path of each route, we set the default locale accordingly:
Rails.application.config.i18n.default_locale = Rails.env.test? ? 'en' : 'it'
