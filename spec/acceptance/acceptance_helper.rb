require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "steak"
require "factory_girl_rails"

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
