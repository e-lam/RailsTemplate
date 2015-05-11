# >--------------------------------[ Devise ]---------------------------------<

environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

after_bundle do
  generate 'devise:install'
  generate 'devise user'
  generate 'devise:views'

end