source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',                            '~> 5.0.0'
gem 'puma',                             '~> 3.0'
gem 'sass-rails',                       '~> 5.0'
gem 'uglifier',                         '~> 3.2'
gem 'coffee-rails',                     '~> 4.2'
gem 'jquery-rails',                     '~> 4.3'
gem 'turbolinks',                       '~> 5'
gem 'jbuilder',                         '~> 2.5'
gem 'devise',                           '~> 4.3'
gem 'bootstrap-generators',             '~> 3.3.4'
gem 'haml-rails',                       '~> 1.0'
gem 'font-awesome-rails',               '~> 4.7'
gem 'twilio-ruby',                      '~> 4.13'
gem 'therubyracer',                     '~> 0.12.3'
gem 'bootstrap-sass',                   '~> 3.3'
gem 'simple_form',                      '~> 3.5'
gem 'jquery-turbolinks',                '~> 2.1'
gem 'bootstrap3-datetimepicker-rails',  '~> 4.17'
gem 'active_link_to',                   '~> 1.0'
gem 'cancan',                           '~> 1.6'

gem 'sqlite3' # TODO: replace with pg

# GIT-BASED GEMS
gem 'bootstrap-datepicker-rails', require: 'bootstrap-datepicker-rails', git: 'https://github.com/Nerian/bootstrap-datepicker-rails.git'
gem 'twitter-typeahead-rails', git: "https://github.com/yourabi/twitter-typeahead-rails.git"

group :development, :test do
  gem 'byebug',   '~> 9.0', platform: :mri
  gem 'erb2haml', '~> 0.1.5'
end

group :development do
  gem 'web-console',  '~> 3.5'
  gem 'listen',       '~> 3.0.5'

  gem 'spring',                 '~> 2.0'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
