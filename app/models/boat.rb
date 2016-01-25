class Boat < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	has_many :followboats
	has_many :followingusers, through: :followboats, source: :user

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :containers, presence: true
	validates :containers, numericality: true
	validates :location, presence: true
	validates :location, inclusion: {in: ["Boston", "NY", "NJ", "CT"]}

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
