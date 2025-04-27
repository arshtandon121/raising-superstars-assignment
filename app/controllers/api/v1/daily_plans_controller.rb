module Api
  module V1
    class DailyPlansController < ApplicationController
      def index
        if params[:program_id]
          @daily_plans = DailyPlan.where(program_id: params[:program_id])
        else
          @daily_plans = DailyPlan.all
        end
        render json: @daily_plans
      end

      def show
        @daily_plan = DailyPlan.find(params[:id])
        render json: @daily_plan, include: { daily_plan_activities: { include: :activity } }
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Daily plan not found" }, status: :not_found
      end

      def show_by_day
        @daily_plan = DailyPlan.find_by(program_id: params[:program_id], day_number: params[:day_number])
        
        if @daily_plan
          render json: @daily_plan, include: { daily_plan_activities: { include: :activity } }
        else
          render json: { error: "Daily plan not found for this day" }, status: :not_found
        end
      end
    end
  end
end