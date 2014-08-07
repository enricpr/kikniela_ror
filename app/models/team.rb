class Team < ActiveRecord::Base
  validates :name, :code, :color1, :color2, presence: true
	has_many :assignments
  has_many :games, through: :assignments
	accepts_nested_attributes_for :assignments
end
