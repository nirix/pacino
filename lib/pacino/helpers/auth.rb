#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

helpers do
  def logged_in?
    session[:logged_in] ? true : false
  end
  
  def authorize!
    redirect url('/login')
  end
  
  def current_user
    @currentuser
  end
end