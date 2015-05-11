# >----------------------------[ Initial Setup ]------------------------------<

git clone: 'git@github.com:e-lam/RailsTemplate.git'

initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
end
RUBY

require destination_root.to_s + '/RailsTemplate/lib/helpers'


def source_paths
  # File.expand_path(File.dirname(__FILE__)),
  [destination_root.to_s + '/RailsTemplate/']
end

# >----------------------------[ Gems ]------------------------------<

apply destination_root.to_s + '/RailsTemplate/lib/gems.rb'

# >-----------------------------[ Procfile ]-------------------------------<

file 'Procfile', <<-CODE
web: bundle exec rails server -p $PORT
CODE

# >---------------------------------[ Load all Recipes ]---------------------------------<

Dir[destination_root.to_s + '/RailsTemplate/recipes/*.rb'].each do |file|
  say_recipe File.basename(file, File.extname(file))
  apply file
end

# >---------------------------------[ Post-Recipes ]---------------------------------<

rake 'db:migrate'

remove_dir destination_root.to_s + '/RailsTemplate'