class Api::V1::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.includes(:exercises).all
  end
end
