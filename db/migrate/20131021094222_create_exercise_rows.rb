class CreateExerciseRows < ActiveRecord::Migration
  def change
    create_table :exercise_rows do |t|

      t.timestamps
    end
  end
end
