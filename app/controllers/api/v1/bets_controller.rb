class Api::V1::BetsController < ApplicationController
	respond_to :json

  def index
    #respond_with Bet.all
		@bets = Bet.all
		respond_to do |format|
			format.html { render html: @bets }
			format.json { render json: @bets }
		end
  end

  def show
    respond_with bet
  end

  def create
    #respond_with :api, :v1, Bet.create(bet_params)
		@bet = Bet.new(bet_params)
		respond_to do |format|
			if @bet.save
				format.html { redirect_to @bet, notice: 'Post was successfully created.' }
				format.json { render json: @bet }
			else
				format.html { render action: 'new' }
				format.json { render json: @bet.errors, status: :unprocessable_entity }
			end
		end
  end

  def update
    respond_with bet.update(bet_params)
  end

  def destroy
    respond_with bet.destroy
  end

  private

  def bet
    Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:week, :tip, :hit, :game_id, :user_id, :updated_at)
  end

end