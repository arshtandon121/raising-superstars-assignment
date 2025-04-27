
A REST API for serving daily activities for the Prodigy Programs mobile app.

## Setup

1. Clone the repository
2. Run `bundle install`
3. Configure the database in `config/database.yml`
4. Run `rails db:create db:migrate db:seed`
5. Start the server with `rails s`

## API Endpoints

### Programs

- `GET /api/v1/programs` - List all programs
- `GET /api/v1/programs/:id` - Get details of a specific program

### Daily Plans

- `GET /api/v1/daily_plans` - List all daily plans
- `GET /api/v1/daily_plans/:id` - Get details of a specific daily plan
- `GET /api/v1/programs/:program_id/day/:day_number` - Get the daily plan for a specific day of a program

### User Progress

- `GET /api/v1/users/:user_id/progress` - Get the user'\''s progress across all programs
- `POST /api/v1/user_activities` - Mark an activity as completed
- `PUT /api/v1/user_activities/:id` - Update the completion status of an activity

