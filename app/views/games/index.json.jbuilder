json.array!(@games) do |game|
  json.extract! game, :id, :team1, :team2, :result, :week
  json.url game_url(game, format: :json)
end
