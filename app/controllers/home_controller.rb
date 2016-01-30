class HomeController < ApplicationController
  def index
  	@leaderboard_users = User.leaderboard_users
  end

  def history
  end

  def log

  end
end
