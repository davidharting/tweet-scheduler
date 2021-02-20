class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  # Would probably want to make sure these are unique
  # But I will only be attaching to my one twitter account so relaxing this constraint
  # validates :username, uniqueness: true

  def send_tweet!(body)
    client.update(body)
  end

  private

  def client
    Twitter::REST::Client.new({
      consumer_key: Rails.application.credentials.dig(:twitter, :api_key),
      consumer_secret: Rails.application.credentials.dig(:twitter, :api_key_secret),
      access_token: token,
      access_token_secret: secret,
    })
  end
end
