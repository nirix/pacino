require 'sinatra'
require 'rocketeer'
require 'sequel'

module Pacino
  __DIR__ = ::File.dirname(__FILE__)
  
  configure do
    set :views => __DIR__ + '/pacino/views'
  end
  
  class << self
    attr_accessor :database, :root, :public
    
    def run
      set :public_folder => self.public
      
      require 'pacino/helpers/init'
      require 'pacino/models/init'
      require 'pacino/nodes/init'
    end # run
  end # class << self
end # Pacino

require 'pacino/version'