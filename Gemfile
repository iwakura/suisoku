source 'https://rubygems.org'
gem 'rails', '4.1.1'
gem 'pg'
gem 'bcrypt'
gem 'zoopla', git: 'https://github.com/iwakura/zoopla.git'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 4.0.3'

group :development do
  gem 'thin', require: false
  gem 'awesome_print'
  gem 'wirble'
  gem 'quiet_assets'
  gem 'spring'
end

group :development, :test do
  gem 'minitest-rails'
end

group :test do
  gem 'fabrication'
  gem 'ffaker'
  gem 'webmock', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
