#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

module Pacino
  helpers do
    
    ##
    # Renders the specified template
    #
    # @param [String] template The template to load
    # @param [Hash] options The options for the template
    #
    def render_view(template, options = {})
      options = {:layout => :'layouts/default'}.merge(options)
      template = template.to_sym
      erb(template, options)
    end
    
    ##
    # Renders a partial view
    #
    # @param [String] template The template to load
    # @param [Hash] vars The local variables for the partial
    #
    def render_partial(template, vars = {})
      template_array = template.to_s.split('/')
      template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      erb(template.to_sym, :locals => vars, :layout => false)
    end
  end
end