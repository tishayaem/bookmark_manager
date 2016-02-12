require 'bcrypt'
require_relative '../data_mapper_setup.rb'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text

  attr_reader :email, :password
  attr_accessor :password_confirmation
  validates_presence_of :email
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    end


end
