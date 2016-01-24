class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :boat
  validates :origin, presence: true
  validates :origin, inclusion: {in: ["US", "Canada", "Mexico", "Cuba"]}
  validates :destination, presence: true
  validates :destination, inclusion: {in: ["Italy", "China", "India", "Japan"]}
  validates :contneeded, presence: true
  validates :contneeded, numericality: true
  validates :cargo, presence: true
  validates :cargo, length: {minimum: 50, maximum: 1000}
  validates :jobcost, presence: true
  validates :jobcost, numericality: { greater_than_or_equal_to: 1000 }
end
