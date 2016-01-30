
class User < ActiveRecord::Base
	require 'elo.rb'
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :winning_games, class_name: "Game", foreign_key: "winning_user_id"
  has_many :losing_games, class_name: "Game", foreign_key: "losing_user_id"

  def self.opponents(user_email)
  	opponent_emails = Array.new
  	User.all.each do |u|
  		opponent_emails << u.email if u.email != user_email
  	end
  	opponent_emails
  end

  def self.calculate_leaderboard(winning_user, losing_user)
  	winning_rp = RatedPlayer.new(winning_user.email,winning_user.leaderboard_score)
		losing_rp = RatedPlayer.new(losing_user.email,losing_user.leaderboard_score)
		
		Match.new(winning_rp,losing_rp,1)
		
		winning_user.leaderboard_score = winning_rp.rating
		losing_user.leaderboard_score = losing_rp.rating

		winning_user.games_played += 1
		losing_user.games_played += 1

		winning_user.save
		losing_user.save
	end

	def self.leaderboard_users
		User.order("leaderboard_score DESC").all
	end
end
