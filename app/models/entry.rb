class Entry < ActiveRecord::Base
  validates :title, :body, { presence: true }
end
