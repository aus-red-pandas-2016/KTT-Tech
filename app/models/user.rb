class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :burns
  has_many :counters
  has_many :comments, as: commentable 
end
