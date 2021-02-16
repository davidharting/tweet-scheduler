class OmniauthCallbacksController < ApplicationController
  def twitter
    details = get_twitter_account_from_hash
    Rails.logger.info(details)
    twitter_account = Current.user.twitter_accounts.where(username: details[:username]).first_or_initialize
    if twitter_account.update(details)
      redirect_to twitter_accounts_path, notice: "Succesfully connected your account"
    else
      puts(twitter_account.errors.full_messages)
      redirect_to twitter_accounts_path, alert: "Unable to connect your account"
    end
  end

  def get_twitter_account_from_hash
    hash = auth_hash
    token = hash[:token]
    secret = hash[:secret]
    username = hash.dig(:extra, :screen_name)
    {
      :name => hash.info.name,
      :username => hash.info.nickname,
      :image => hash.info.image,
      :token => hash.credentials.token,
      :secret => hash.credentials.secret,
    }
  end

  def auth_hash
    # Omniauth has its own way of making the credentials available to us
    # via a hash on the callback url.
    request.env["omniauth.auth"]
  end
end
