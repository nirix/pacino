module Pacino
  get '/' do
    @posts = Post.order(:published_at.desc)
    render_view 'index'
  end
  
  #get '/:slug_slug.:post_id' do
  #  @post = Post[params[:post_id]]
  #  render_view 'posts/view'
  #end
end