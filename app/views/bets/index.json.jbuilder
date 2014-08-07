json.array!(@bets) do |bet|
  json.extract! bet, :id, :user_id, :game_id, :week, :hit, :tip
  json.url bet_url(bet, format: :json)
end
