require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :burns
  has_many :counters
  has_many :comments, as: :commentable

  validates :username, uniqueness: true
  validates :username, :password, {presence: true}

  def password
    @password ||= Password.new(secure_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.secure_password = @password
  end

  def authenticate(password)
    self.password == password
  end

end
