module Api
  module V1
    class UserActivitiesController < ApplicationController
      def create
        @user_activity = UserActivity.new(user_activity_params)
        
        if @user_activity.save
          render json: @user_activity, status: :created
        else
          render json: { errors: @user_activity.errors }, status: :unprocessable_entity
        end
      end
      
      def update
        @user_activity = UserActivity.find(params[:id])
        
        if @user_activity.update(user_activity_params)
          render json: @user_activity
        else
          render json: { errors: @user_activity.errors }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User activity not found" }, status: :not_found
      end
      
      private
      
      def user_activity_params
        params.require(:user_activity).permit(:user_id, :activity_id, :daily_plan_id, :completed, :completed_at)
      end
    end
  end
end