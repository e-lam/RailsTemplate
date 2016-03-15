inject_into_file 'app/controllers/application_controller.rb', :after => "class ApplicationController < ActionController::Base\n" do
  <<-'RUBY'
  include Pundit
  RUBY
end

after_bundle do
  generate 'pundit:install'
end