# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'active_model_serializers', '~> 0.10.10'
gem 'puma', '~> 3.11'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
group :development, :test do
  gem 'awesome_print', '~> 1.8'
  gem 'bullet', '~> 6.1'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.13'
  gem 'fasterer', '~> 0.8.3'
  gem 'fuubar', '~> 2.5'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'rubocop-rails', '~> 2.7', '>= 2.7.1'
  gem 'shoulda-matchers', '~> 4.3'
end
group :test do
  gem 'json_matchers', '~> 0.11.1'
end

group :development do
  gem 'jsonlint', '~> 0.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
