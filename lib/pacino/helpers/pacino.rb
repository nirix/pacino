module Pacino
  helpers do
    def render_view(template, options = {})
      options = {:layout => :'layouts/default'}.merge(options)
      template = template.to_sym
      erb(template, options)
    end
    
    def render_partial(template, args = {})
      template_array = template.to_s.split('/')
      template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      erb(template.to_sym, :locals => args, :layout => false)
    end
  end
end