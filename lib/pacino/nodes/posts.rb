#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

module Pacino
  get '/' do
    @posts = Post.order(:published_at.desc)
    render_view 'index'
  end
  
  get /\/[\w]+.([0-9]+)/ do |post_id|
    @post = Post[post_id]
    render_view 'posts/view'
  end
end