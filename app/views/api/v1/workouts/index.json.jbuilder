json.workouts do
  json.array! @workouts do |workout|
    json.id workout.id
    json.name workout.name
    json.exercises workout.exercise_ids
  end
end
