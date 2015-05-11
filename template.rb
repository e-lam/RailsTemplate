# >----------------------------[ Initial Setup ]------------------------------<

initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
end
RUBY

def say_custom(tag, text)
  ; say "\033[1m\033[36m" + tag.to_s.rjust(10) + "\033[0m" + "  #{text}"
end

def say_recipe(name)
  ; say "\033[1m\033[36m" + "recipe".rjust(10) + "\033[0m" + "  Running #{name} recipe..."
end


# >----------------------------[ / Initial Setup ]------------------------------<

# Gem Parts

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

file 'Procfile', <<-CODE
web: bundle exec rails server -p $PORT
CODE

# >-----------------------------[ Run Bundler ]-------------------------------<

say_custom 'Bundler', "Running Bundler install. This will take a while."

run 'bundle install'

# >--------------------------------[ simple_form ]---------------------------------<

say_recipe 'simple_form'

generate 'simple_form:install'

# >--------------------------------[ Devise ]---------------------------------<

say_recipe 'Devise'

generate 'devise:install'

generate 'devise user'

environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

generate 'devise:views'


# >------------------------------[ RailsAdmin ]-------------------------------<

say_recipe 'RailsAdmin'

generate 'rails_admin:install'

# >---------------------------------[ RSpec ]---------------------------------<

say_recipe 'RSpec'

inject_into_file "config/initializers/generators.rb", :after => "Rails.application.config.generators do |g|\n" do
  "    g.test_framework = :rspec\n"
end

generate 'rspec:install'

# >---------------------------------[ high_voltage ]---------------------------------<

say_recipe 'high_voltage'

run 'mkdir app/views/pages'

file 'app/views/pages/home.html.erb', <<-CODE
  <h1>Welcome !</h1>
CODE

initializer 'high_voltage.rb', <<-CODE
HighVoltage.configure do |config|
  config.home_page = 'home'
end
CODE

route "root to: 'high_voltage/pages#show', id: 'home'"

# >---------------------------------[ Pre-load ]---------------------------------<

rake 'db:migrate'
