class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Current.user.tweets
    @has_connected_account = Current.user.twitter_accounts.any?
  end

  def new
    @tweet = Tweet.new
    @twitter_accounts = Current.user.twitter_accounts
  end

  def edit
  end

  def update
    schedule_new_job? = @tweet.publish_at != tweet_params[:publish_at]
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Successfully updated tweet"
    else
      render :edit
    end
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled succesfully"
    else
      # I think I am getting an error because when I render new here,
      @twitter_accounts = Current.user.twitter_accounts
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was removed from the schedule"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :twitter_account_id, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
    @twitter_accounts = Current.user.twitter_accounts
  end
end
