source 'http://rubygems.org'

gem 'rails', '~> 3.0.3'

gem 'compass', '~> 0.11.1'
gem 'devise'
gem 'formtastic'
gem 'haml', '~> 3.1'
gem 'sass', '~> 3.1'
gem 'haml-rails'
gem 'jquery-rails'

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


gem 'mysql2'

# Rack server
gem 'thin'

