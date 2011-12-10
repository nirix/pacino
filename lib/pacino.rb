require 'sinatra'
require 'rocketeer'
require 'sequel'

module Pacino
  __DIR__ = ::File.dirname(__FILE__)
  
  configure do
    set :views => __DIR__ + '/pacino/views'
  end
  
  class << self
    attr_accessor :database
    
    def run
      require 'pacino/helpers/init'
      require 'pacino/models/init'
      require 'pacino/nodes/init'
    end #run
  end # class << self
end # Pacino

require 'pacino/version'