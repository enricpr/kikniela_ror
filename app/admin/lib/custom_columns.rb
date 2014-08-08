module ActiveAdmin
  module Views
    class IndexAsTable < ActiveAdmin::Component		
			def game_teams game
				"#{game.team1} - #{game.team2}"
			end
		end
	end
end