# >---------------------------------[ RSpec ]---------------------------------<

inject_into_file "config/initializers/generators.rb", :after => "Rails.application.config.generators do |g|\n" do
  "    g.test_framework = :rspec\n"
end

after_bundle do
  generate 'rspec:install'
end