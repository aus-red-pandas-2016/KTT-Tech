class Counter < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :burn
  belongs_to :user
  has_many :votes, as: :votable
end
