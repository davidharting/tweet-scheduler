class SendTweetJob < ApplicationJob
  queue_as :default

  def perform(tweet_id)
    tweet = Tweet.find_by(id: tweet_id)
    if tweet.nil?
      Rails.logger.info("Skipping job, could not find tweet with id #{tweet_id}")
      return false
    end
    if tweet.published?
      Rails.logger.info("Skipping job, tweet already published, id=#{tweet_id}")
      return false
    end
    if tweet.publish_at > Time.current
      Rails.logger.info("Skipping job, tweet not ready to be published yet, id=#{tweet_id}")
      return false
    end

    tweet.publish_to_twitter!
  end
end
