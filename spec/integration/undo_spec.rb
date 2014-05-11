require "spec_helper_rails"
require "undo"
require 'undo/integration/shared_undo_integration_examples.rb'

Undo.configure do |config|
  config.storage = Undo::Storage::RailsCache.new
end

describe Undo do
  include_examples "undo integration"
end
