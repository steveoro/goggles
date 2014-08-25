class AddConstraintsToGoggleCupStandards < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        ADD CONSTRAINT fk_goggle_cup_standards_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
  end

  def down  
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        DROP FOREIGN KEY fk_goggle_cup_definitions_swimmers
    SQL
  end    
end
