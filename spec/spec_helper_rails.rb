if !!ENV['CI']
  require 'coveralls'
  Coveralls.wear!
else
  require 'pry'
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../rails_app/config/environment', __FILE__)
require 'rspec'
