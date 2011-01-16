source 'http://rubygems.org'

gem 'rails', '~> 3.0.3'

gem 'compass'
gem 'devise'
gem 'formtastic'
gem 'haml-rails'
gem 'html5-boilerplate'
gem 'jquery-rails'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'


# gems only required for development and not app functionality
group :development do
  gem 'heroku'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'ruby-debug19'
end

group :test do
  if RUBY_PLATFORM =~ /darwin/
    gem 'autotest-fsevent'
    gem 'autotest-growl'
    gem 'autotest-rails'
    gem 'ZenTest'
  end
  gem 'capybara'
  gem 'cucumber'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'launchy'
  gem 'shoulda'
end


gem 'sqlite3-ruby', :require => 'sqlite3'

# Rack server
gem 'thin'

