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
    end
  end
end