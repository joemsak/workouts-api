class Api::V1::WorkoutsController < ApplicationController
  def index
    render json: { workouts: Workout.all }
  end
end
