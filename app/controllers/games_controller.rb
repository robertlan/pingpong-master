class GamesController < ApplicationController
  def index
  end

  def history
  end

  def new
  	@game = Game.new
  end

  def create
  end
end