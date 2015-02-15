class Api::V1::ExercisesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create, :update],
    if: Proc.new { |c| c.request.format == 'application/json' }

  def show
    render json: { exercise: Exercise.find(params[:id]) }
  end

  def create
    Exercise.create!(exercise_params)
    render nothing: true
  end

  def update
    Exercise.find(params[:id]).update_attributes(exercise_params)
    render nothing: true
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :duration, :weight, :workout_id)
  end
end
