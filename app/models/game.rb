class Game < ActiveRecord::Base
	belongs_to :winning_user, class_name: "User"
	belongs_to :losing_user, class_name: "User"
	
	def self.games_played(user)
		Game.where("winning_user_id = #{user.id} || losing_user_id = #{user.id}")
	end

	def opponent
	end

	def your_score
	end

	def opponent_score
	end
end
