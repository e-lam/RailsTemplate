# >--------------------------------[ Devise ]---------------------------------<

generate 'devise:install'

generate 'devise user'

environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

generate 'devise:views'
