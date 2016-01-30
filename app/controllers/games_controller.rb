class GamesController < ApplicationController

  def index
  end

  def history
  	@games_played = Game.games_played(current_user)
  end

  def new
  	@game = Game.new
  	@opponents = User.opponents(current_user.email)
  end

  def create
  	if params[:game]
  		if params[:game][:your_score].to_i > params[:game][:opponent_score].to_i
  			winning_user = current_user
  			losing_user = User.find_by_email(params[:game][:opponent])
  			User.calculate_leaderboard(winning_user, losing_user)
  			params[:game][:winning_user_id] = winning_user.id
  			params[:game][:losing_user_id] = losing_user.id
  			params[:game][:winning_user_score] = params[:game][:your_score].to_i
  			params[:game][:losing_user_score] = params[:game][:opponent_score].to_i
  		else
  			winning_user = User.find_by_email(params[:game][:opponent])
  			losing_user = current_user
  			User.calculate_leaderboard(winning_user, losing_user)
  			params[:game][:losing_user_id] = losing_user.id
  			params[:game][:winning_user_id] = winning_user.id
  			params[:game][:losing_user_score] = params[:game][:your_score].to_i
  			params[:game][:winning_user_score] = params[:game][:opponent_score].to_i
  		end
  		@game = Game.new(game_params)
  		@game.save
  	end

  	redirect_to "/log"

  end


  private

  def game_params
    params.require(:game).permit(:date_played, :losing_user_id, :winning_user_id, :losing_user_score, :winning_user_score)
  end
end