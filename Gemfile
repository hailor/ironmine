source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#gem 'ruby-mysql'

gem 'liquid',:require=>'liquid'

gem "daemons"

gem "net-ldap"

gem "spreadsheet"

gem "rufus-scheduler"

gem "paperclip", "~> 2.3"

gem "delayed_job"

gem "event-calendar", :require => "event_calendar"

gem 'ri_cal'

gem 'hz2py'
#gem 'composite_primary_keys', '=3.1.0'
#gem "rmmseg"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
#gem 'ferret'
  gem 'mysql2'
end

group :production do
#gem 'jk-ferret'
  gem 'mysql2'
end

group :macdev do
  gem 'mysql2'
end