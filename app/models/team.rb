class Team < ActiveRecord::Base
  validates :name, :code, :color1, :color2, presence: true
  has_many :games, through: :assignment
end
