gem 'simple_form'
gem 'thin'
gem 'foreman'
gem 'devise'
gem 'rails_admin'
gem 'high_voltage', '~> 2.3.0'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'awesome_print'
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