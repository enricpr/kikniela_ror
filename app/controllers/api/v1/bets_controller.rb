class Api::V1::BetsController < ApplicationController
  respond_to :json

  def index
    respond_with Bet.all
  end

  def show
    respond_with bet
  end

  def create
    respond_with :api, :v1, Bet.create(bet_params)
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
    params.require(:bet).permit(:week, :tip, :hit, :game, :user, :updated_at)
  end

end