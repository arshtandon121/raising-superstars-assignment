class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :daily_plan
end
