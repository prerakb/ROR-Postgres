class Job < ActiveRecord::Base
  validates :origin, inclusion: {in: ["US", "Canada", "Mexico", "Cuba"]}
  validates :destination, inclusion: {in: ["Italy", "China", "India", "Japan"]}
  belongs_to :user
  belongs_to :boat

end
