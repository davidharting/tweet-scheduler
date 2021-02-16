class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
    @has_connected_account = Current.user.twitter_accounts.any?
  end

  def new
    @tweet = Tweet.new
    @twitter_accounts = Current.user.twitter_accounts
  end

  def create
    puts(tweet_params)
    redirect_to new_tweet_path, alert: "Create not implemented"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :twitter_account_id, :publish_at)
  end
end
