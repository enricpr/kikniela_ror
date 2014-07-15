class Game < ActiveRecord::Base
  has_many :teams, through: :assignment
  has_many :bets
end
