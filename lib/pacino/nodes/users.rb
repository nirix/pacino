#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

get '/login' do
  @page_title.push 'Login'
  render_view 'users/login', :layout => :'layouts/pacino'
end

post '/login' do
  @page_title.push 'Login'
end

get '/register' do
  @page_title.push 'Register'
  @user = User.new
  render_view 'users/register', :layout => :'layouts/pacino'
end

post '/register' do
  @page_title.push 'Register'
  @user = User.new({
    :username => params[:username],
    :password => params[:password],
    :email    => params[:email],
    :is_admin => 0
  })
  
  if @user.valid?
    @user.save
    redirect url('/login')
  else
    render_view 'users/register', :layout => :'layouts/pacino'
  end
end