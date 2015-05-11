require File.dirname(__FILE__) + '/helpers'

# >----------------------------[ Initial Setup ]------------------------------<

initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
end
RUBY

# >----------------------------[ Gems ]------------------------------<

apply File.dirname(__FILE__) + '/gems.rb'

insert_into_file 'Gemfile', "\nruby '2.2.0'",
                 after: "source 'https://rubygems.org'\n"

# >-----------------------------[ Run Bundler ]-------------------------------<

say_custom 'Bundler', "Running Bundler install. This will take a while."

run 'bundle install'

# >---------------------------------[ Load all Recipes ]---------------------------------<

Dir[File.dirname(__FILE__) + '/recipes/*.rb'].each do |file|
  say_recipe File.basename(file, File.extname(file))
  apply file
end

# >---------------------------------[ Post-Recipes ]---------------------------------<

rake 'db:migrate'

file 'Procfile', <<-CODE
web: bundle exec rails server -p $PORT
CODE
