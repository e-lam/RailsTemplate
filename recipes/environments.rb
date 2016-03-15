copy_file destination_root.to_s + '/config/environments/production.rb', destination_root.to_s + '/config/environments/staging.rb'

inject_into_file 'config/environments/staging.rb', :after => "Rails.application.configure do\n" do
  <<-'RUBY'

  Mail.register_interceptor RecipientInterceptor.new('staging@example.com')

  RUBY
end

inject_into_file 'config/application.rb', :after => "class Application < Rails::Application\n" do
  <<-'RUBY'

  config.middleware.use Rack::Deflater

  RUBY
end

