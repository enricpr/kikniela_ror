json.array!(@teams) do |team|
  json.extract! team, :id, :name, :code, :color1, :color2
  json.url team_url(team, format: :json)
end
