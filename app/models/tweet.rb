class Tweet < ApplicationRecord
  belongs_to :twitter_account
  belongs_to :user

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  # after_initialize runs after you create a new instance
  after_initialize do
    self.publish_at ||= 24.hours.from_now # Set if not already initialized
  end
end
