module Api
  module V1
    class ProgramsController < ApplicationController
      def index
        @programs = Program.all
        render json: @programs
      end

      def show
        @program = Program.find(params[:id])
        render json: @program, include: [:daily_plans]
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Program not found" }, status: :not_found
      end
      
      def program_full_data
        program = Program.includes(daily_plans: { daily_plan_activities: :activity }).find_by(id: params[:id])
      
        if program
          render json: program.as_json(
            only: [:id, :name, :description, :duration_days],
            include: {
              daily_plans: {
                only: [:id, :day_number],
                include: {
                  daily_plan_activities: {
                    only: [:id, :position],
                    include: {
                      activity: {
                        only: [:id, :title, :description]
                      }
                    }
                  }
                }
              }
            }
          )
        else
          render json: { error: "Program not found" }, status: :not_found
        end
      end
      
        
    end
  end
end