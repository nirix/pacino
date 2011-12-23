#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

module Pacino
  before '/login' do
    @page_title.push 'Login'
  end

  before '/register' do
    @page_title.push 'Register'
  end

  get '/login' do
    render_view 'users/login', :layout => :'layouts/pacino'
  end

  post '/login' do
    if user = User.login(params[:username], params[:password])
      session[:logged_in] = true
      response.set_cookie("_sess", {
        :value => [user.id, user.login_id],
        :path => '/',
        :expires => Time.now + (7 * 24 * 60 * 60 * 60) # 1 week
      })
      
      redirect url('/')
    else
      @error = true
    end
  end

  get '/register' do
    @user = User.new
    render_view 'users/register', :layout => :'layouts/pacino'
  end

  post '/register' do
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
end