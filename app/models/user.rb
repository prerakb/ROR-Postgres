class User < ActiveRecord::Base
	has_secure_password
	has_many :boats
	has_many :followboats
	has_many :followedboats, through: :followboats, source: :boat
end
