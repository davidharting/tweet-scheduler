class Tweet < ApplicationRecord
  belongs_to :twitter_account
  belongs_to :user

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  # after_initialize runs after you create a new instance
  after_initialize do
    self.publish_at ||= 24.hours.from_now # Set if not already initialized
  end

  def published?
    # Rails provides these boolean helper methods that check if the field has a vlaue
    tweet_id?
  end

  def publish_to_twitter!
    response = twitter_account.send_tweet!(body)
    update(tweet_id: response.id)
  end
end
