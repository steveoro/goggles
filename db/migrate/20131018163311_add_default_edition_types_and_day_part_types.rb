class AddDefaultEditionTypesAndDayPartTypes < ActiveRecord::Migration
  def up
   say 'Adding DayPartType default data...'
    day_part_types = [
      { :id => 1, :code => 'M' },
      { :id => 2, :code => 'P' },
      { :id => 3, :code => 'S' },
      { :id => 4, :code => 'N' }
    ]
    DayPartType.transaction do                      # -- START TRANSACTION --
      day_part_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        DayPartType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying DayPartType rows existence...'
    day_part_types.each { |hash|
      raise "DayPartType with code #{hash[:code]} not found!" unless DayPartType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


   say 'Adding EditionType default data...'
    edition_types = [
      { :id => 1, :code => 'O' },
      { :id => 2, :code => 'R' },
      { :id => 3, :code => 'N' },
      { :id => 4, :code => 'A' },
      { :id => 5, :code => 'S' }
    ]
    EditionType.transaction do                      # -- START TRANSACTION --
      edition_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        EditionType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying EditionType rows existence...'
    edition_types.each { |hash|
      raise "EditionType with code #{hash[:code]} not found!" unless EditionType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }
  end
  # ---------------------------------------------------------------------------


  def down
    say 'Deleting default data for DayPartType...'
    DayPartType.delete_all
    say 'Deleting default data for EditionType...'
    EditionType.delete_all
  end
  # ---------------------------------------------------------------------------
end
