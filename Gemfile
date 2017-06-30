source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise'
gem 'bootstrap-generators', '~> 3.3.4'
gem 'haml-rails'
gem "font-awesome-rails"

gem 'twilio-ruby'
gem "therubyracer"
gem 'bootstrap-sass'
gem 'simple_form'
gem 'jquery-turbolinks'
gem 'bootstrap3-datetimepicker-rails'
gem 'bootstrap-datepicker-rails', require: 'bootstrap-datepicker-rails', git: 'https://github.com/Nerian/bootstrap-datepicker-rails.git'
gem 'twitter-typeahead-rails', git: "https://github.com/yourabi/twitter-typeahead-rails.git"
gem 'active_link_to'
gem 'cancan'

group :development, :test do
  gem 'byebug', platform: :mri
  gem "erb2haml"
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
