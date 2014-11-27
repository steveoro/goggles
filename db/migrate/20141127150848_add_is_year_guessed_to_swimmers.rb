class AddIsYearGuessedToSwimmers < ActiveRecord::Migration
  def up
    change_table :swimmers do |t|
      t.boolean :is_year_guessed, :null => false, :default => false, :comment => 'TRUE when the birth date is not available and is guessed by current meeting result category value'
    end
  end
  # ---------------------------------------------------------------------------

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
