require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.1.3'
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.11'
gem 'fog'
gem "rspec-rails", ">= 2.8.1", :group => [:development, :test]
gem "database_cleaner", ">= 0.7.1", :group => :test
gem "mongoid-rspec", ">= 1.4.4", :group => :test
gem "machinist", :group => :test
gem "factory_girl_rails", ">= 1.6.0", :group => :test
gem "cucumber-rails", ">= 1.2.1", :group => :test
gem "capybara", ">= 1.1.2", :group => :test
gem "launchy", ">= 2.0.5", :group => :test
gem "guard", ">= 0.6.2", :group => :development
gem "faker"
gem "backbone-on-rails"
gem "rabl"
gem "pry"
gem "awesome_print"
gem "mongoid-history"

case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.4.3"
gem "devise", ">= 2.0.0"
gem "cancan"
gem "switch_user"
gem "rails-footnotes", ">= 3.7", :group => :development
gem "faye"
