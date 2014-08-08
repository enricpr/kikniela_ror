class User < ActiveRecord::Base
  has_many :bets
  validates :name, presence: true, uniqueness: true
  has_secure_password
	
	scope :topUsers, where(:points => !nil)
	#scope :topUsers, ->(num) { order('points DESC').limit(num) }
end
