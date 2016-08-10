class Burn < ActiveRecord::Base
  belongs_to :user
  has_many :counters, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  #has_and_belongs_to_many :tags
  has_many :votes, as: :votable, dependent: :destroy
end
