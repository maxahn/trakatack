class Task < ApplicationRecord
  belongs_to :user
  has_many :work_periods, dependent: :destroy

  validates :description, presence: true
  validates :estimated_duration, presence: true

  enum priority: [ :low, :medium, :high ]
  validates :priority, presence: true

  #validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "score is not within the valid range [0,100]"}
end
