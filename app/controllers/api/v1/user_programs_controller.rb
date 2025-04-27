module Api
  module V1
    class UserProgramsController < ApplicationController
      def index
        if params[:user_id]
          @user_programs = UserProgram.where(user_id: params[:user_id])
        else
          @user_programs = UserProgram.all
        end
        render json: @user_programs, include: :program
      end
      
      def create
        @user_program = UserProgram.new(user_program_params)
        
        if @user_program.save
          render json: @user_program, status: :created
        else
          render json: { errors: @user_program.errors }, status: :unprocessable_entity
        end
      end
      
      def progress
        user_id = params[:user_id]
        user_activities = UserActivity.where(user_id: user_id)
        user_programs = UserProgram.where(user_id: user_id)
        
        progress_data = user_programs.map do |user_program|
          program = user_program.program
          daily_plans = program.daily_plans
          
          completed_activities = user_activities
            .where(daily_plan_id: daily_plans.pluck(:id), completed: true)
            .count
            
          total_activities = DailyPlanActivity
            .where(daily_plan_id: daily_plans.pluck(:id))
            .count
            
          {
            program_id: program.id,
            program_name: program.name,
            start_date: user_program.start_date,
            completed_activities: completed_activities,
            total_activities: total_activities,
            progress_percentage: total_activities > 0 ? (completed_activities.to_f / total_activities * 100).round(2) : 0
          }
        end
        
        render json: { progress: progress_data }
      end
      
      private
      
      def user_program_params
        params.require(:user_program).permit(:user_id, :program_id, :start_date)
      end
    end
  end
end