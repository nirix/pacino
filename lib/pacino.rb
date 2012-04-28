#
# Pacino
# Copyright (c) 2011-2012 Jack Polgar
#
# Pacino is released under
# the GPLv3 only license.
#

require 'pacino/version'
require 'sinatra'
require 'rocketeer'
require 'yaml'
require 'redcarpet/compat'

module Pacino
  class << self
    attr_accessor :title
    
    ##
    # Runs Pacino
    def run
      # Configure the app
      configure do
        @DIR = File.dirname(__FILE__)
        
        # Load the config file
        conf = YAML.load_file Dir.pwd + '/config.yml'
        self.title = conf['title']
        
        set :views => @DIR + '/pacino/views'
      end
      
      # Helpers
      helpers do
        ##
        # Markdown helper
        def mrkdwn(txt)
          ::Markdown.new(txt).to_html
        end
      end
  
      ## Do stuff before every page
      before do
        # Get the posts
        @posts = {}
        Dir.glob('posts/*.yml').reverse.each do |p|
          # Load the post file
          post = YAML.load_file p
          # Add it to the posts hash
          @posts[:"#{post['slug']}"] = post
        end
      end
  
      # Index page
      get '/' do
        erb :index, :layout => :'layouts/default'
      end
      
      # Style file
      get '/css/style.css' do
        scss :'css/style'
      end
    end
  end
end