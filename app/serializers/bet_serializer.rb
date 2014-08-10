class BetSerializer < ActiveModel::Serializer
  attributes :id, :user, :game, :week, :tip, :hit, :updated_at
end