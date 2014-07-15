json.array!(@bets) do |bet|
  json.extract! bet, :id, :tip, :hit, :user_id, :game_id
  json.url bet_url(bet, format: :json)
end
