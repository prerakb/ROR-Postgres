class Boat < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :containers, presence: true
	validates :containers, numericality: true
	validates :location, presence: true
	validates :location, inclusion: {in: ["Boston", "NY", "NJ", "CT"]}
end
