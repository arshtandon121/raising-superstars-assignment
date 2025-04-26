class Program < ApplicationRecord
    has_many :daily_plans, dependent: :destroy
    has_many :user_programs, dependent: :destroy
    has_many :users, through: :user_programs

    validates :name, presence: true
    validates :duration_days, numericality: { greater_than: 0 }
end
