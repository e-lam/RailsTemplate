insert_into_file 'Gemfile', "\nruby '2.2.0'", after: "source 'https://rubygems.org'\n"

gem 'simple_form', '~> 3.2.1'

gem 'puma', '~> 2.11.3'
gem 'foreman', '~> 0.78.0'

gem 'browser', '~> 1.1'

gem 'devise', '~> 3.5.6'
gem 'high_voltage', '~> 2.3.0'

gem 'seedbank'

gem 'recipient_interceptor'
gem 'pundit', '1.1.0'

gem_group :development do
  gem 'letter_opener'
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'bullet'
end

gem_group :test do
  gem 'launchy'
  # FactoryGirl instead of Rails fixtures (https://github.com/thoughtbot/factory_girl)
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rails_best_practices', :require => false
  gem 'simplecov', :require => false
  gem 'json_spec'
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'codeclimate-test-reporter', require: nil
end

gem_group :production do
  # For Rails 4 deployment on Heroku
  gem 'rails_12factor'
  gem 'pg', '0.18.1'
end
