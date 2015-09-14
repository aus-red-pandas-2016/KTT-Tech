class Entry < ActiveRecord::Base
  validates :title, :body, { presence: true }

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end

  def date_written
    created_at.strftime('%B %e, %Y')
  end

  def stubbed_body
    return body if less_than_26_words_long?
    first_25_words +  '...'
  end

  private
  def less_than_26_words_long?
    !(body.match first_25_words_regex)
  end

  def first_25_words
    body.slice first_25_words_regex
  end

  def first_25_words_regex
    /\A(\S+\s){25}/
  end
end
