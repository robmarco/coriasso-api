source 'https://rubygems.org'

# Core
gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'

# Basic
gem 'sass-rails', '~> 5.0'        # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'        # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'      # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'                # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'kaminari'
gem 'rack-cors', :require => 'rack/cors'
gem 'devise'
# Logging
gem "lograge"
# gem "sentry-raven"
# Files
gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git'
gem 'aws-sdk', '>= 2.0.34' # If using paperclip `master` (upcoming v5.0)
# Search
gem 'pg_search'
# Deployment
gem 'figaro'
gem 'puma', '~> 3.0'
# Background processing
gem 'redis'
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'bullet'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'rack-mini-profiler', require: false
  # Deployment with Capistrano
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
  gem 'capistrano-rails-db'
  gem 'capistrano-rails-console'
  gem 'capistrano-figaro-yml'
end

group :production do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.3.1'
