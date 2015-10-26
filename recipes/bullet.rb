inject_into_file 'config/environments/development.rb', :after => "Rails.application.configure do\n" do
  <<-'RUBY'

config.after_initialize do
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.console = true
  Bullet.rails_logger = true
  Bullet.add_footer = true
end

  RUBY
end

inject_into_file 'config/environments/test.rb', :after => "Rails.application.configure do\n" do
  <<-'RUBY'

config.after_initialize do
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.raise = true # raise an error if n+1 query occurs
end

  RUBY
end