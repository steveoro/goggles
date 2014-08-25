class AddConstraintsToGoggleCupDefinitions < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE goggle_cup_definitions
        ADD CONSTRAINT fk_goggle_cup_definitions_goggle_cups
        FOREIGN KEY (goggle_cup_id)
        REFERENCES goggle_cups(id)
    SQL
    execute <<-SQL
      ALTER TABLE goggle_cup_definitions
        ADD CONSTRAINT fk_goggle_cup_definitions_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL
  end

  def down  
    execute <<-SQL
      ALTER TABLE goggle_cup_definitions
        DROP FOREIGN KEY fk_goggle_cup_definitions_goggle_cups
    SQL
    execute <<-SQL
      ALTER TABLE goggle_cup_definitions
        DROP FOREIGN KEY fk_goggle_cup_definitions_seasons
    SQL
  end    
end
