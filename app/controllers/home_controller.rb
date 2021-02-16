class HomeController < ApplicationController
  def show
    @show_connect_twitter = Current.user && Current.user.twitter_accounts.count < 1
  end
end
