class AddDefaultEditionTypesAndDayPartTypes < ActiveRecord::Migration
  def up
   say 'Adding DayTypePart default data...'
    day_type_parts = [
      { :id => 1, :code => 'M' },
      { :id => 2, :code => 'P' },
      { :id => 3, :code => 'S' },
      { :id => 4, :code => 'N' }
    ]
    DayTypePart.transaction do                      # -- START TRANSACTION --
      day_type_parts.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        DayTypePart.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying DayTypePart rows existence...'
    day_type_parts.each { |hash|
      raise "DayTypePart with code #{hash[:code]} not found!" unless DayTypePart.find_by_code( hash[:code] )
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
    say 'Deleting default data for DayTypePart...'
    DayTypePart.delete_all
    say 'Deleting default data for EditionType...'
    EditionType.delete_all
  end
  # ---------------------------------------------------------------------------
end
