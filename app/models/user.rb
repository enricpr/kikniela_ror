class User < ActiveRecord::Base
  has_many :bets
  validates :name, presence: true, uniqueness: true
  has_secure_password
	
	scope :topUsers, where(:points => !nil)
	
	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
