# >------------------------------[ RailsAdmin ]-------------------------------<

if yes?('Do you want RailsAdmin ?')

  gem 'rails_admin'

  after_bundle do
    generate 'rails_admin:install'
  end

end