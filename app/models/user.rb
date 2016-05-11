class User < ActiveRecord::Base
	has_secure_password
	validates :name, :username, presence: true
	validates :name, :username, uniqueness: true
	has_many :boats
	has_many :followboats
	has_many :followedboats, through: :followboats, source: :boat
end
