class User < ApplicationRecord
    has_many :user_programs
    has_many :programs, through: :user_programs
    has_many :user_activities

    validates :email, presence: true, uniqueness: true
end
