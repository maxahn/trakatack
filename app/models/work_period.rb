class WorkPeriod < ApplicationRecord
  belongs_to :task
  validates :duration, presence: true, numericality: {integer: true, greater_than: 0}

end
