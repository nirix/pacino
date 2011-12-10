module Pacino
  helpers do
    def render_view(template, options = {})
      options = {:layout => :'layouts/default'}.merge(options)
      template = template.to_sym
      erb(template, options)
    end
  end
end