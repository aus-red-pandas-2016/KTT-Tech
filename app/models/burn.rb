class Burn < ActiveRecord::Base
  belongs_to :user
  has_many :counters
  has_many :comments
  # has__and_belongs_to_many :tags
  has_many :votes, as: :votable_id
end
