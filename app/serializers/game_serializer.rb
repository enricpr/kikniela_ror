class GameSerializer < ActiveModel::Serializer
  attributes :id, :team1, :team2, :result, :week, :deadline
end