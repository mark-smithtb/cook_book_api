source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

###############################################################################
# Core
gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'jwt'                       # Token Auth


###############################################################################
# General
gem 'devise'                    # Login
gem 'kaminari'                  # Pagination
gem 'nokogiri'                  # HTML Parser
gem 'pg_search'                 # Postgres Search
gem 'simple_form'               # Semantic Forms

###############################################################################
# Content
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'        # Build JSON APIs with ease
gem 'haml-rails'                # Sexy views
###############################################################################
# Attachments
gem 'fog-aws'
gem 'carrierwave'
gem 'carrierwave-base64'        # for base64 image uploads
gem 'mini_magick'


group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'rspec-rails', '~> 3.4'
  gem 'rails-controller-testing'  # render views check in controller
  gem 'webmock'                   # Stubing HTTP calls
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', '~> 4.6', require: false
  gem 'terminal-notifier-guard'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
