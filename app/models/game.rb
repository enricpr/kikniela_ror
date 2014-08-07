class Game < ActiveRecord::Base
	has_many :assignments
  has_many :teams, through: :assignments
  has_many :bets
end
