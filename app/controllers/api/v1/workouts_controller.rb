class Api::V1::WorkoutsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create,
    if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    @workouts = Workout.includes(:exercises).all
  end

  def create
    @workout = Workout.create!(workout_params)
    render json: { workout: @workout }
  end

  private
  def workout_params
    params.require(:workout).permit(:name)
  end
end
