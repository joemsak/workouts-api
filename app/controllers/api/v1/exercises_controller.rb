class Api::V1::ExercisesController < ApplicationController
  skip_before_filter :verify_authenticity_token, if: Proc.new { |c|
    c.request.format == 'application/json'
  }

  def show
    render json: { exercise: Exercise.find(params[:id]) }
  end

  def create
    @exercise = Exercise.create!(exercise_params)
    render json: @exercise
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :duration, :weight, :workout_id)
  end
end
