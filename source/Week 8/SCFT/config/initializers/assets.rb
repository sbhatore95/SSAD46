# Be sure to restart your server when you modify this file.
#-> or <- SSAD IS THE BEST
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( jquery.mmenu.all.css )
Rails.application.config.assets.precompile += %w( demo.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
