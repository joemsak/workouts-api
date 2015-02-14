class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :duration
      t.integer :weight
      t.references :workout, index: true

      t.timestamps null: false
    end
    add_foreign_key :exercises, :workouts
  end
end
