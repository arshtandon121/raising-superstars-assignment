Prodigy Programs API: Complete Project Explanation
Project Overview
The Prodigy Programs API is designed to serve data for a mobile application that provides daily 5-minute activities for users to complete, based on your provided requirements. The system serves "Prodigy Programs" where each program has a series of daily plans consisting of short activities, and users can track their progress by marking activities as complete.
Core Requirements

Provide RESTful APIs to serve data for mobile app consumption
Display daily 5-minute activities organized by day number
Allow users to mark activities as complete
Track user progress through programs
Focus on quality data models, complete code, and good product sense

Model Explanations
User

Purpose: Represents application users who enroll in programs and complete activities
Attributes:

name: User's full name
email: Unique identifier for login/authentication


Relationships:

Has many UserPrograms (program enrollments)
Has many UserActivities (completed activities)



Program

Purpose: Represents a structured developmental program (e.g., "Early Development Month Program")
Attributes:

name: Title of the program
description: Detailed explanation of the program's purpose
duration_days: Total number of days the program runs (e.g., 30 days)


Relationships:

Has many DailyPlans (one for each day)
Has many UserPrograms (users enrolled)



Activity

Purpose: Individual 5-minute development activities for users to complete
Attributes:

title: Brief descriptive name (e.g., "Mirror Play")
description: Detailed instructions for performing the activity
duration_minutes: Length of activity (typically 5 minutes)


Relationships:

Included in many DailyPlanActivities
Tracked in UserActivities when completed



DailyPlan

Purpose: Organizes activities for a specific day of a program
Attributes:

program_id: Associated program
day_number: The day within the program (e.g., day 14)


Relationships:

Belongs to a Program
Has many DailyPlanActivities (activities for that day)



DailyPlanActivity

Purpose: Join table that associates activities with specific daily plans and defines their order
Attributes:

daily_plan_id: Associated daily plan
activity_id: Associated activity
position: Order/sequence of the activity in the daily plan


Relationships:

Belongs to a DailyPlan
Belongs to an Activity



UserProgram

Purpose: Tracks a user's enrollment in a specific program
Attributes:

user_id: Associated user
program_id: Associated program
start_date: When the user started the program


Relationships:

Belongs to a User
Belongs to a Program



UserActivity

Purpose: Records when a user completes a specific activity
Attributes:

user_id: Associated user
activity_id: Associated activity
daily_plan_id: Associated daily plan
completed: Boolean indicating completion status
completed_at: Timestamp of completion


Relationships:

Belongs to a User
Belongs to an Activity
Belongs to a DailyPlan



API Endpoints

Programs

GET /api/v1/programs: List all available programs
GET /api/v1/programs/:id: Get details of a specific program


Daily Plans

GET /api/v1/daily_plans: List all daily plans
GET /api/v1/daily_plans/:id: Get details of a specific daily plan
GET /api/v1/programs/:program_id/day/:day_number: Get daily plan for a specific day of a program


Activities

GET /api/v1/activities: List all activities
GET /api/v1/activities/:id: Get details of a specific activity


User Progress

GET /api/v1/users/:user_id/progress: Get progress report for a user
POST /api/v1/user_activities: Mark an activity as completed
PUT /api/v1/user_activities/:id: Update completion status of an activity


User Programs

POST /api/v1/user_programs: Enroll a user in a program
GET /api/v1/user_programs: List program enrollments



Data Flow

A user enrolls in a program (UserProgram record created)
The app shows daily activities based on the day number relative to their start date
The app fetches daily activities using the /programs/:program_id/day/:day_number endpoint
When a user completes an activity, the app posts to /user_activities to record completion
The app can fetch progress data using the /users/:user_id/progress endpoint

Key Implementation Aspects

Authentication: Basic HTTP authentication for API security
JSON Response Structure: Well-structured JSON responses with proper relationships
Error Handling: Appropriate HTTP status codes and error messages
Data Validation: Model validations to ensure data integrity
RESTful Design: Following REST conventions for predictable API behavior

Technical Benefits of this Architecture

Scalability: The design easily scales to handle more programs, activities, and users
Flexibility: New activity types can be added without schema changes
Progress Tracking: Comprehensive tracking of user engagement and completion
API Versioning: Using the /api/v1/ namespace allows for future API versions
Data Integrity: Proper relationships and constraints maintain data quality

The entire system is built to provide a streamlined experience for the mobile app while maintaining robust data relationships and tracking capabilities. The architecture focuses on clear separation of concerns between programs, activities, daily plans, and user progress tracking.RetryClaude can make mistakes. Please double-check responses. 3.7 Sonnet