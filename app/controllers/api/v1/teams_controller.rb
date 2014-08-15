class Api::V1::TeamsController < ApplicationController
  before_filter :authenticate_user!
	respond_to :json

  def index
		@teams = Team.all
		respond_to do |format|
			format.html { render html: @teams }
			format.json { render json: @teams }
		end
  end

  def show
    respond_with team
  end

  def create
		@team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_with team.update(team_params)
  end

  def destroy
    respond_with team.destroy
  end

  private

  def team
    Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :code, :color1, :color2)
  end

end