# db/seeds.rb
# Create a program
program = Program.create!(
  name: "Early Development Month Program",
  description: "A month-long program with daily 5-minute activities to boost early development skills",
  duration_days: 30
)

# Create activities
activities = [
  Activity.create!(title: "Animal Sounds", description: "Make different animal sounds for your baby", duration_minutes: 5),
  Activity.create!(title: "Mirror Play", description: "Use a mirror to show baby their reflection", duration_minutes: 5),
  Activity.create!(title: "Tummy Time", description: "Place baby on tummy to strengthen neck muscles", duration_minutes: 5),
  Activity.create!(title: "Sensory Play", description: "Let baby touch different textures", duration_minutes: 5),
  Activity.create!(title: "Reading Time", description: "Read a colorful book to your baby", duration_minutes: 5),
  Activity.create!(title: "Singing Session", description: "Sing songs with hand movements", duration_minutes: 5),
  Activity.create!(title: "Peek-a-boo", description: "Play peek-a-boo to teach object permanence", duration_minutes: 5),
  Activity.create!(title: "Tracking Objects", description: "Move a toy slowly for baby to track", duration_minutes: 5)
]

# Create daily plans for day 14-21
(14..21).each do |day|
  daily_plan = DailyPlan.create!(
    program: program,
    day_number: day
  )
  
  # Add 3 random activities to each day's plan
  activities.sample(3).each_with_index do |activity, index|
    DailyPlanActivity.create!(
      daily_plan: daily_plan,
      activity: activity,
      position: index + 1
    )
  end
end

# Create a test user
user = User.create!(
  name: "Test User",
  email: "test@example.com"
)

# Enroll user in the program
user_program = UserProgram.create!(
  user: user,
  program: program,
  start_date: Date.today - 14.days # Start 14 days ago
)

# Mark some activities as completed
daily_plan = DailyPlan.find_by(program: program, day_number: 14)
daily_plan.activities.each do |activity|
  UserActivity.create!(
    user: user,
    activity: activity,
    daily_plan: daily_plan,
    completed: true,
    completed_at: DateTime.now - 13.days
  )
end