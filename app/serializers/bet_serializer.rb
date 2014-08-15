class BetSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :week, :tip, :hit, :updated_at
end