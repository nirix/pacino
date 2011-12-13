#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

before do
  @page_title = [];
  
  if request.cookies["_sess"]
    user = User.auth_via_cookie(*request.cookies["_sess"].split('&'))
  else
    user = false
  end
  if user
    @currentuser = user
    session[:logged_in] = true
  else
    @currentuser = User.new({:username => 'Guest', :is_admin => 0})
    session[:logged_in] = false
  end
end