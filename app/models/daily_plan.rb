class DailyPlan < ApplicationRecord
  belongs_to :program
  has_many :daily_plan_activities, dependent: :destroy
  has_many :activities, through: :daily_plan_activities

  validates :day_number, presence: true, numericality: { greater_than: 0 }
end
