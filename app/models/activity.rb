class Activity < ApplicationRecord
    has_many :daily_plan_activities
    has_many :daily_plans, through: :daily_plan_activities
    has_many :user_activities

    validates :title, presence: true
    validates :duration_minutes, numericality: { greater_than: 0 }
end
