class Api::V1::GamesController < ApplicationController
  respond_to :json

  def index
    respond_with Game.all
  end

  def show
    respond_with game
  end

  def create
    respond_with :api, :v1, Game.create(game_params)
  end

  def update
    respond_with game.update(game_params)
  end

  def destroy
    respond_with game.destroy
  end

  private

  def game
    Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:team1, :team2, :result, :week)
  end

end