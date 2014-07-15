class Game < ActiveRecord::Base
  has_many :teams, through: :assignment
end
