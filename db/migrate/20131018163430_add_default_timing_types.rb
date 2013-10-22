class AddDefaultTimingTypes < ActiveRecord::Migration
  def up
   say 'Adding TimingType default data...'
    timing_types = [
      { :id => 1, :code => 'M' },
      { :id => 3, :code => 'S' },
      { :id => 4, :code => 'A' }
    ]
    TimingType.transaction do                      # -- START TRANSACTION --
      timing_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        TimingType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying TimingType rows existence...'
    timing_types.each { |hash|
      raise "TimingType with code #{hash[:code]} not found!" unless TimingType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }
  end
  # ---------------------------------------------------------------------------


  def down
    say 'Deleting default data for TimingType...'
    TimingType.delete_all
  end
  # ---------------------------------------------------------------------------
end
