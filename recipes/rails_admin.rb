# >------------------------------[ RailsAdmin ]-------------------------------<

if yes?('Do you want RailsAdmin ? (Write yes)')

  gem 'rails_admin', '~> 0.8.1'

  after_bundle do
    generate 'rails_admin:install'
  end

end