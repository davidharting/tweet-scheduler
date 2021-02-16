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
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled succesfully"
    else
      # I think I am getting an error because when I render new here,
      @twitter_accounts = Current.user.twitter_accounts
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :twitter_account_id, :publish_at)
  end
end
