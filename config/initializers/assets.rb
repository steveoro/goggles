# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path [Steve, 20161024] (Currently not required)
# Example:
#Rails.application.config.assets.paths << 'jumbotron'
#Rails.application.config.assets.paths << 'tutorial'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
#Rails.application.config.assets.precompile += ['*.coffee', '*.js', '*.scss', '*.css', '*.css.erb']
Rails.application.config.assets.precompile += %w( training_row_form.js )
