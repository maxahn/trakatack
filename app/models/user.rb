class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :work_periods, through: :tasks
  validates :first_name, presence: true
  validates :daily_hours, numericality: {only_integer: true, greater_than: 0, less_than: 24, message: "Available daily work hours need to be greater than or equal to 1 and less than or equal to 24" }
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
    format: { with: VALID_EMAIL_REGEX }

  enum rank: [ :bronze, :silver, :gold, :platinum, :diamond ]
end
