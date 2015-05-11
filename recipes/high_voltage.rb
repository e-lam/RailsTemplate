# >---------------------------------[ high_voltage ]---------------------------------<

run 'mkdir app/views/pages'

file 'app/views/pages/home.html.erb', <<-CODE
  <h1>Welcome !</h1>
CODE

initializer 'high_voltage.rb', <<-CODE
HighVoltage.configure do |config|
  config.home_page = 'home'
end
CODE