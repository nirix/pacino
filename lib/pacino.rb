#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

require 'sinatra'
require 'rocketeer'
require 'sequel'
require 'bycrypt'

module Pacino
  __DIR__ = ::File.dirname(__FILE__)
  
  # Configuration
  configure do
    # Set the views directory..
    set :views => __DIR__ + '/pacino/views'
  end
  
  class << self
    # Setup setters/getters
    attr_accessor :title, :database, :root, :public
    
    # Pretty much starts Pacino
    def run
      # Set the public directory
      if not self.public
        self.public = self.root + '/public'
      end
      set :public_folder => self.public
      
      # Set a title if one wasn't set...
      self.title = 'Pacino' if not self.title
      
      # Load the helpers, models and controllers or "nodes"
      require 'pacino/helpers/init'
      require 'pacino/models/init'
      require 'pacino/nodes/init'
    end # run
  end # class << self
end # Pacino

require 'pacino/version'