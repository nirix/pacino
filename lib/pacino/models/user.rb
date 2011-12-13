#
# Pacino
# Copyright (c) 2011 Jack Polgar
#
# @license New BSD License
# @copyright Jack P.
# @author Jack P. <nrx@nirix.net>
#

class User < Sequel::Model
  # Relationships
  one_to_many :posts
  
  # Validation
  def validate
    validates_unique :username, :message => "Username is already taken"
    validates_format /^\w+$/i, :username, :message => "Username can only contain letters and numbers"
    validates_format /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :email, :message => "Email is not valid"
    validates_unique :email, :message => "Email is already registered"
    validates_presence :password, :message => "Password cannot be blank"
  end
  
  # Authorize via cookie
  def self.auth_via_cookie(uid = nil, hash = nil)
    return false unless uid != nil and hash != nil
    user = where("id = ?", uid).where("login_id = ?", hash).limit(1).first
    return (user and user.id = uid and user.login_id = hash) ? user : false
  end
  
  # Before create
  def before_create
    self.prepare_password
    self.do_timestamps_create
  end
  
  # Before save
  def before_save
    self.do_timestamps_save
  end
  
  # Prepare password
  def prepare_password
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.salt, self.password = salt, Digest::SHA256.hexdigest(self.password + salt)
  end
end