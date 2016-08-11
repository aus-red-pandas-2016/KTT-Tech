class Counter < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :burn
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy

  validates :user, presence: true

  def points
    if self.votes != []
      self.votes.map {|vote| vote.value }.flatten.inject(:+)
    else
      return 0
    end
  end
end
