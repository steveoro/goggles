class AddDefaultTypesPart2 < ActiveRecord::Migration
  def up
    say 'Adding EntryTimeType default data...'
    EntryTimeType.transaction do            # -- START TRANSACTION --
      EntryTimeType::TYPES_HASH.each { |id, code|
        EntryTimeType.create( { :id => id, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying EntryTimeType rows existence...'
    EntryTimeType::TYPES_HASH.each { |id, code|
      raise "EntryTimeType with code #{code} not found!" unless EntryTimeType.find_by_code( code )
      say "Code '#{code}' found."
    }


    say 'Adding PassageType default data...'
    passage_types = [
      { :code => 'P0025', :length_in_meters => 25 },
      { :code => 'P0050', :length_in_meters => 50 },
      { :code => 'P0075', :length_in_meters => 75 },
      { :code => 'P0100', :length_in_meters => 100 },
      { :code => 'P0150', :length_in_meters => 150 },
      { :code => 'P0200', :length_in_meters => 200 },
      { :code => 'P0300', :length_in_meters => 300 },
      { :code => 'P0400', :length_in_meters => 400 },
      { :code => 'P0500', :length_in_meters => 500 },
      { :code => 'P0600', :length_in_meters => 600 },
      { :code => 'P0700', :length_in_meters => 700 },
      { :code => 'P0800', :length_in_meters => 800 },
      { :code => 'P0900', :length_in_meters => 900 },
      { :code => 'P1000', :length_in_meters => 1000 },
      { :code => 'P1100', :length_in_meters => 1100 },
      { :code => 'P1200', :length_in_meters => 1200 },
      { :code => 'P1300', :length_in_meters => 1300 },
      { :code => 'P1400', :length_in_meters => 1400 },
      { :code => 'P1500', :length_in_meters => 1500 }
    ]
    PassageType.transaction do                     # -- START TRANSACTION --
      passage_types.each { |hash|
        PassageType.create( { :code => hash[:code], :length_in_meters => hash[:length_in_meters] } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying PassageType rows existence...'
    passage_types.each { |hash|
      raise "PassageType with code #{hash[:code]} not found!" unless PassageType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding RelayType default data...'
    relay_types = [
      { :code => 'S4X50MI',   :mixed_gender => 0, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 50, :stroke_type_id => StrokeType::MIXED_ID },

      { :code => 'M4X50MI',   :mixed_gender => 1, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 50, :stroke_type_id => StrokeType::MIXED_ID },

      { :code => 'M4X50SL',   :mixed_gender => 1, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 50, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'S4X50SL',   :mixed_gender => 0, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 50, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'S8X25SL',   :mixed_gender => 0, :partecipants => 4, :phases => 8,
        :phase_length_in_meters => 25, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'M4X100SL',   :mixed_gender => 1, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 100, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'S4X100SL',   :mixed_gender => 0, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 100, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'S4X200SL',   :mixed_gender => 0, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 200, :stroke_type_id => StrokeType::FREESTYLE_ID },

      { :code => 'S4X100MI',   :mixed_gender => 0, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 100, :stroke_type_id => StrokeType::MIXED_ID },

      { :code => 'M4X100MI',   :mixed_gender => 1, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 100, :stroke_type_id => StrokeType::MIXED_ID },

      { :code => 'M4X200SL',   :mixed_gender => 1, :partecipants => 4, :phases => 4,
        :phase_length_in_meters => 200, :stroke_type_id => StrokeType::FREESTYLE_ID }
    ]
    RelayType.transaction do                        # -- START TRANSACTION --
      relay_types.each { |hash|
        RelayType.create({
          :code => hash[:code], :mixed_gender => hash[:mixed_gender],
          :partecipants => hash[:partecipants], :phases => hash[:phases],
          :phase_length_in_meters => hash[:phase_length_in_meters],
          :stroke_type_id => hash[:stroke_type_id]
        })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying RelayType rows existence...'
    relay_types.each { |hash|
      raise "RelayType with code #{hash[:code]} not found!" unless RelayType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding EventsByPoolType default data...'
    events_by_pool_types = [
      { :pool_type_id => 1, :event_type_id => 1 },
      { :pool_type_id => 1, :event_type_id => 2 },
      { :pool_type_id => 1, :event_type_id => 3 },
      { :pool_type_id => 1, :event_type_id => 4 },
      { :pool_type_id => 1, :event_type_id => 5 },
      { :pool_type_id => 1, :event_type_id => 6 },
      { :pool_type_id => 1, :event_type_id => 7 },
      { :pool_type_id => 1, :event_type_id => 8 },
      { :pool_type_id => 1, :event_type_id => 9 },
      { :pool_type_id => 1, :event_type_id => 10 },
      { :pool_type_id => 1, :event_type_id => 11 },
      { :pool_type_id => 1, :event_type_id => 12 },
      { :pool_type_id => 1, :event_type_id => 13 },
      { :pool_type_id => 1, :event_type_id => 14 },
      { :pool_type_id => 1, :event_type_id => 15 },
      { :pool_type_id => 1, :event_type_id => 16 },
      { :pool_type_id => 1, :event_type_id => 17 },
      { :pool_type_id => 1, :event_type_id => 18 },
      { :pool_type_id => 2, :event_type_id => 1 },
      { :pool_type_id => 2, :event_type_id => 2 },
      { :pool_type_id => 2, :event_type_id => 3 },
      { :pool_type_id => 2, :event_type_id => 4 },
      { :pool_type_id => 2, :event_type_id => 5 },
      { :pool_type_id => 2, :event_type_id => 6 },
      { :pool_type_id => 2, :event_type_id => 7 },
      { :pool_type_id => 2, :event_type_id => 8 },
      { :pool_type_id => 2, :event_type_id => 9 },
      { :pool_type_id => 2, :event_type_id => 10 },
      { :pool_type_id => 2, :event_type_id => 11 },
      { :pool_type_id => 2, :event_type_id => 12 },
      { :pool_type_id => 2, :event_type_id => 13 },
      { :pool_type_id => 2, :event_type_id => 14 },
      { :pool_type_id => 2, :event_type_id => 15 },
      { :pool_type_id => 2, :event_type_id => 17 },
      { :pool_type_id => 2, :event_type_id => 18 }
    ]
    EventsByPoolType.transaction do                     # -- START TRANSACTION --
      events_by_pool_types.each { |hash|
        EventsByPoolType.create( { :pool_type_id => hash[:pool_type_id], :event_type_id => hash[:event_type_id] } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying EventsByPoolType rows existence...'
    events_by_pool_types.each { |hash|
      raise "EventsByPoolType (#{hash[:pool_type_id]},#{hash[:event_type_id]}) not found!" unless EventsByPoolType.exists?( :pool_type_id => hash[:pool_type_id], :event_type_id => hash[:event_type_id] )
      say "Tuple (#{hash[:pool_type_id]},#{hash[:event_type_id]}) found."
    }


    say 'Adding HeatType default data...'
    heat_types = [
      { :id => HeatType::HEAT_ID,   :is_default_value => false }, # Heat/Battery result
      { :id => HeatType::SEMI_ID,   :is_default_value => false }, # Semi-final result
      { :id => HeatType::FINALS_ID, :is_default_value => true }   # Final result
    ]
    HeatType.transaction do                     # -- START TRANSACTION --
      heat_types.each { |hash|
        HeatType.create( {
            :id => hash[:id],
            :code => HeatType::TYPES_HASH[ hash[:id] ],
            :is_default_value => hash[:is_default_value]
        } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying HeatType rows existence...'
    heat_types.each { |hash|
      raise "HeatType with code #{hash[:code]} not found!" unless HeatType.find_by_code(
          HeatType::TYPES_HASH[ hash[:id] ]
      )
      say "Code '#{HeatType::TYPES_HASH[ hash[:id] ]}' found."
    }

    say 'Done.'
  end
  # ---------------------------------------------------------------------------


  def down
    say 'Deleting default data for HeatType...'
    HeatType.delete_all
    say 'Deleting default data for EventsByPoolType...'
    EventsByPoolType.delete_all
    say 'Deleting default data for RelayType...'
    RelayType.delete_all
    say 'Deleting default data for PassageType...'
    PassageType.delete_all
    say 'Deleting default data for AccreditationTimeType...'
    AccreditationTimeType.delete_all

    say 'Done.'
  end
  # ---------------------------------------------------------------------------
end
