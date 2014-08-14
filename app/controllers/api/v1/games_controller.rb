class Api::V1::GamesController < ApplicationController
  before_filter :authenticate_user!
	respond_to :json

  def index
    #respond_with Game.all
		@games = Game.all
		respond_to do |format|
			format.html { render html: @games }
			format.json { render json: @games }
		end
  end

  def show
    respond_with game
  end

  def create
    #respond_with :api, :v1, Game.create(game_params)
		@game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
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