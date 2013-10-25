class RemoveCodeFromExerciseRows < ActiveRecord::Migration
  def change
    remove_index :exercise_rows, :code

    change_table(:exercise_rows) do |t|
      t.remove( :code )
    end
  end
end
