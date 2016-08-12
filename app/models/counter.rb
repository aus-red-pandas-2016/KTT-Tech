class Counter < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :burn
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy
end
