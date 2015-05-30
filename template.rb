# >----------------------------[ Initial Setup ]------------------------------<

git clone: 'git@github.com:e-lam/RailsTemplate.git'

initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
end
RUBY

require destination_root.to_s + '/RailsTemplate/lib/helpers'

# Add Ruby Version for rbenv
file '.ruby-version', <<-CODE
2.2.0
CODE

def source_paths
  # File.expand_path(File.dirname(__FILE__)),
  [destination_root.to_s + '/RailsTemplate/']
end

# >----------------------------[ Gems ]------------------------------<

apply destination_root.to_s + '/RailsTemplate/lib/gems.rb'

# >-----------------------------[ Procfile ]-------------------------------<

file 'Procfile', <<-CODE
web: bundle exec puma -C config/puma.rb
CODE

# >-----------------------------[ Buildpacks 4 Heroku ]-------------------------------<

file '.buildpacks', <<-CODE
https://github.com/heroku/heroku-buildpack-nodejs.git
https://github.com/heroku/heroku-buildpack-ruby.git
CODE

# >---------------------------------[ Load all Recipes ]---------------------------------<

Dir[destination_root.to_s + '/RailsTemplate/recipes/*.rb'].each do |file|
  say_recipe File.basename(file, File.extname(file))
  apply file
end

# >---------------------------------[ Post-Recipes ]---------------------------------<

rake 'db:migrate'

remove_dir destination_root.to_s + '/RailsTemplate'