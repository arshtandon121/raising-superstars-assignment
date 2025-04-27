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
        user = User.includes(user_programs: { program: { daily_plans: :daily_plan_activities } }, user_activities: :daily_plan).find(params[:user_id])
      
        progress_data = user.user_programs.map do |user_program|
          program = user_program.program
          daily_plans = program.daily_plans
      
          daily_plan_ids = daily_plans.map(&:id)
      
          completed_count = user.user_activities.where(daily_plan_id: daily_plan_ids, completed: true).count
      
          total_activities = daily_plans.sum { |dp| dp.daily_plan_activities.size }
      
          {
            program_id: program.id,
            program_name: program.name,
            start_date: user_program.start_date,
            completed_activities: completed_count,
            total_activities: total_activities,
            progress_percentage: total_activities.positive? ? ((completed_count.to_f / total_activities) * 100).round(2) : 0
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