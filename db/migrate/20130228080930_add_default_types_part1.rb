class AddDefaultTypesPart1 < ActiveRecord::Migration
  def up
    say 'Adding PoolType default data...'
    PoolType.transaction do                         # -- START TRANSACTION --
      PoolType::TYPES_HASH.each { |key, value|
        PoolType.create( { :id => key, :code => value.to_s, :length_in_meters => value } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying PoolType rows existence...'
    PoolType::TYPES_HASH.each { |key, value|
      raise "PoolType with code #{value} not found!" unless PoolType.find_by_code( value )
      say "Tuple (ID #{key}, Code '#{value}') found."
    }


    say 'Adding GenderType default data...'
    GenderType.transaction do                       # -- START TRANSACTION --
      GenderType::TYPES_HASH.each { |key, code|
        GenderType.create( { :id => key, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying GenderType rows existence...'
    GenderType::TYPES_HASH.each { |key, code|
      raise "GenderType with code #{code} not found!" unless GenderType.find_by_code( code )
      say "Tuple (ID #{key}, Code '#{code}') found."
    }


    say 'Adding PresenceType default data...'
    presence_types = [
      { :id => PresenceType::PRESENT_ID,    :value => 100 },
      { :id => PresenceType::LATE_ID,       :value => 75 },
      { :id => PresenceType::EARLY_OUT_ID,  :value => 75 },
      { :id => PresenceType::ABSENT_ID,     :value => 0 }
    ]
    PresenceType.transaction do                     # -- START TRANSACTION --
      presence_types.each { |hash|
        PresenceType.create( {
          :id       => hash[:id],
          :code     => PresenceType::TYPES_HASH[ hash[:id] ],
          :value    => hash[:value]
        } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying PresenceType rows existence...'
    presence_types.each { |hash|
      raise "PresenceType with code #{hash[:code]} not found!" unless PresenceType.find_by_code(
          PresenceType::TYPES_HASH[ hash[:id] ]
      )
      say "Code '#{PresenceType::TYPES_HASH[ hash[:id] ]}' found."
    }

    say 'Adding FederationType default data...'
    federation_types = [
      { :id => 1, :code => 'FIN',  :description => 'FEDERAZIONE ITALIANA NUOTO',  :short_name => 'FIN' },
      { :id => 2, :code => 'CSI',  :description => 'CENTRO SPORTIVO ITALIANO',    :short_name => 'CSI' },
      { :id => 3, :code => 'UISP', :description => 'UNIONE ITALIANA SPORT',       :short_name => 'UISP' },

      { :id => 4, :code => 'LEN', :description => 'LIGUE EUROPEENNE de NATATATION',:short_name => 'LEN' },
      { :id => 5, :code => 'FINA', :description => 'FEDERATION INTERNATIONALE de NATATION', :short_name => 'FINA' }
    ]
    FederationType.transaction do                   # -- START TRANSACTION --
      federation_types.each { |hash|
        FederationType.create({
          :id => hash[:id],
          :code => hash[:code], :description => hash[:description],
          :short_name => hash[:short_name]
        })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying FederationType rows existence...'
    federation_types.each { |hash|
      raise "FederationType with code #{hash[:code]} not found!" unless FederationType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding SeasonType default data...'
    season_types = [
      { :id => 1, :code => 'MASFIN', :description => 'CAMPIONATO ITALIANO MASTER FIN',
        :short_name => 'MASTER FIN',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'FIN'}[:id] },
      { :id => 2, :code => 'MASCSI', :description => 'CAMPIONATO REGIONALE MASTER EMILIA ROMAGNA CSI',
        :short_name => 'REGIONALE MASTER CSI',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'CSI'}[:id] },
      { :id => 3, :code => 'MASUISP', :description => 'CAMPIONATO ITALIANO MASTER UISP',
        :short_name => 'MASTER UISP',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'UISP'}[:id] },
      { :id => 4, :code => 'AGOFIN', :description => 'CAMPIONATO ITALIANO AGONISTI FIN',
        :short_name => 'AGONISTI FIN',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'FIN'}[:id] },
      { :id => 5, :code => 'AGOCSI', :description => 'CAMPIONATO REGIONALE AGONISTI CSI',
        :short_name => 'AGONISTI CSI',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'CSI'}[:id] },
      { :id => 6, :code => 'AGOUISP', :description => 'CAMPIONATO ITALIANO AGONISTI UISP',
        :short_name => 'AGONISTI UISP',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'UISP'}[:id] },

      { :id => 7, :code => 'MASLEN', :description => 'LEN EUROPEAN MASTER CHAMPIONSHIP',
        :short_name => 'MASTER LEN',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'LEN'}[:id] },
      { :id => 8, :code => 'MASFINA', :description => 'FINA WORLD MASTER CHAMPIONSHIP',
        :short_name => 'MASTER FINA',
        :federation_type_id => federation_types.find{ |el| el[:code] == 'FINA'}[:id] }
    ]
    SeasonType.transaction do                   # -- START TRANSACTION --
      season_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        SeasonType.create({
          :id => hash[:id],
          :code => hash[:code], :description => hash[:description],
          :short_name => hash[:short_name],
          :federation_type_id => hash[:federation_type_id]
        })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying SeasonType rows existence...'
    season_types.each { |hash|
      raise "SeasonType with code #{hash[:code]} not found!" unless SeasonType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding StrokeType default data...'
    StrokeType.transaction do                       # -- START TRANSACTION --
      StrokeType::TYPES_HASH.each { |key, code|
        StrokeType.create( { :id => key, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying StrokeType rows existence...'
    StrokeType::TYPES_HASH.each { |key, code|
      raise "StrokeType with code #{code} not found!" unless StrokeType.find_by_code( code )
      say "Tuple (ID #{key}, Code '#{code}') found."
    }


    say 'Adding EventType default data...'
    event_types = [
      { :code => '50SL',  :length_in_meters => 50,    :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '100SL', :length_in_meters => 100,   :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '200SL', :length_in_meters => 200,   :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '400SL', :length_in_meters => 400,   :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '800SL', :length_in_meters => 800,   :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '1500SL',:length_in_meters => 1500,  :is_a_relay => false, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => '50FA',  :length_in_meters => 50,    :is_a_relay => false, :stroke_type_id => StrokeType::BUTTERFLY_ID },
      { :code => '100FA', :length_in_meters => 100,   :is_a_relay => false, :stroke_type_id => StrokeType::BUTTERFLY_ID },
      { :code => '200FA', :length_in_meters => 200,   :is_a_relay => false, :stroke_type_id => StrokeType::BUTTERFLY_ID },
      { :code => '50DO',  :length_in_meters => 50,    :is_a_relay => false, :stroke_type_id => StrokeType::BACKSTROKE_ID },
      { :code => '100DO', :length_in_meters => 100,   :is_a_relay => false, :stroke_type_id => StrokeType::BACKSTROKE_ID },
      { :code => '200DO', :length_in_meters => 200,   :is_a_relay => false, :stroke_type_id => StrokeType::BACKSTROKE_ID },
      { :code => '50RA',  :length_in_meters => 50,    :is_a_relay => false, :stroke_type_id => StrokeType::BREASTSTROKE_ID },
      { :code => '100RA', :length_in_meters => 100,   :is_a_relay => false, :stroke_type_id => StrokeType::BREASTSTROKE_ID },
      { :code => '200RA', :length_in_meters => 200,   :is_a_relay => false, :stroke_type_id => StrokeType::BREASTSTROKE_ID },
      { :code => '100MI', :length_in_meters => 100,   :is_a_relay => false, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => '200MI', :length_in_meters => 200,   :is_a_relay => false, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => '400MI', :length_in_meters => 400,   :is_a_relay => false, :stroke_type_id => StrokeType::MIXED_ID },

      { :code => 'S4X50MI',   :length_in_meters => 200, :is_a_relay => true, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => 'M4X50MI',   :length_in_meters => 200, :is_a_relay => true, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => 'M4X50SL',   :length_in_meters => 200, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'S4X50SL',   :length_in_meters => 200, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'S8X25SL',   :length_in_meters => 200, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'M4X100SL',  :length_in_meters => 400, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'S4X100SL',  :length_in_meters => 400, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'S4X200SL',  :length_in_meters => 800, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID },
      { :code => 'S4X100MI',  :length_in_meters => 400, :is_a_relay => true, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => 'M4X100MI',  :length_in_meters => 400, :is_a_relay => true, :stroke_type_id => StrokeType::MIXED_ID },
      { :code => 'M4X200SL',  :length_in_meters => 800, :is_a_relay => true, :stroke_type_id => StrokeType::FREESTYLE_ID }
    ]
    EventType.transaction do                        # -- START TRANSACTION --
      event_types.each { |hash|
        EventType.create({
          :code => hash[:code], :length_in_meters => hash[:length_in_meters],
          :is_a_relay => hash[:is_a_relay], :stroke_type_id => hash[:stroke_type_id]
        })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying EventType rows existence...'
    event_types.each { |hash|
      raise "EventType with code #{hash[:code]} not found!" unless EventType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding CategoryType default data...'
    mas_fin_id = season_types.find{ |el| el[:code] == 'MASFIN'}[:id]
    mas_csi_id = season_types.find{ |el| el[:code] == 'MASCSI'}[:id]
    ago_fin_id = season_types.find{ |el| el[:code] == 'AGOFIN'}[:id]
    ago_csi_id = season_types.find{ |el| el[:code] == 'AGOCSI'}[:id]
    say "(Using: mas_fin_id=#{mas_fin_id}, mas_csi_id=#{mas_csi_id}, ago_fin_id=#{ago_fin_id}, ago_csi_id=#{ago_csi_id})"
    category_types = [
      { :code => 'SEN', :age_begin => 16, :age_end => 19, :description => 'SENIORES', :short_name => 'SEN',
        :season_type_id => mas_csi_id, :federation_code => '1', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M20', :age_begin => 20, :age_end => 24, :description => 'MASTER 20', :short_name => 'M20',
        :season_type_id => mas_csi_id, :federation_code => '2', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M25', :age_begin => 25, :age_end => 29, :description => 'MASTER 25', :short_name => 'M25',
        :season_type_id => mas_csi_id, :federation_code => '3', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M30', :age_begin => 30, :age_end => 34, :description => 'MASTER 30', :short_name => 'M30',
        :season_type_id => mas_csi_id, :federation_code => '4', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M35', :age_begin => 35, :age_end => 39, :description => 'MASTER 35', :short_name => 'M35',
        :season_type_id => mas_csi_id, :federation_code => '5', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M40', :age_begin => 40, :age_end => 44, :description => 'MASTER 40', :short_name => 'M40',
        :season_type_id => mas_csi_id, :federation_code => '6', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M45', :age_begin => 45, :age_end => 49, :description => 'MASTER 45', :short_name => 'M45',
        :season_type_id => mas_csi_id, :federation_code => '7', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M50', :age_begin => 50, :age_end => 54, :description => 'MASTER 50', :short_name => 'M50',
        :season_type_id => mas_csi_id, :federation_code => '8', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'OVER',:age_begin => 55, :age_end => 999, :description => 'OVER 55', :short_name => 'M55',
        :season_type_id => mas_csi_id, :federation_code => '9', :group_name => 'MASTER', :is_a_relay => false },

      { :code => 'M100', :age_begin => 100, :age_end => 119, :description => 'STAFF. M100-119', :short_name => 'M100-119',
        :season_type_id => mas_csi_id, :federation_code => 'x1', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M120', :age_begin => 120, :age_end => 139, :description => 'STAFF. M120-139', :short_name => 'M120-139',
        :season_type_id => mas_csi_id, :federation_code => 'x2', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M140', :age_begin => 140, :age_end => 159, :description => 'STAFF. M140-159', :short_name => 'M140-159',
        :season_type_id => mas_csi_id, :federation_code => 'x3', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M160', :age_begin => 160, :age_end => 179, :description => 'STAFF. M160-179', :short_name => 'M160-179',
        :season_type_id => mas_csi_id, :federation_code => 'x4', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M180', :age_begin => 180, :age_end => 199, :description => 'STAFF. M180-199', :short_name => 'M180-199',
        :season_type_id => mas_csi_id, :federation_code => 'x5', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M200', :age_begin => 200, :age_end => 219, :description => 'STAFF. M200-219', :short_name => 'M200-219',
        :season_type_id => mas_csi_id, :federation_code => 'x6', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M220', :age_begin => 220, :age_end => 239, :description => 'STAFF. M220-239', :short_name => 'M220-239',
        :season_type_id => mas_csi_id, :federation_code => 'x7', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M240', :age_begin => 240, :age_end => 259, :description => 'STAFF. M240-259', :short_name => 'M240-259',
        :season_type_id => mas_csi_id, :federation_code => 'x8', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M260', :age_begin => 260, :age_end => 400, :description => 'STAFF. M260-...', :short_name => 'M260-...',
        :season_type_id => mas_csi_id, :federation_code => 'x9', :group_name => 'MASTER', :is_a_relay => true },

      { :code => 'U25', :age_begin => 20, :age_end => 24, :description => 'UNDER 25', :short_name => 'U25',
        :season_type_id => mas_fin_id, :federation_code => 'A', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M25', :age_begin => 25, :age_end => 29, :description => 'MASTER 25', :short_name => 'M25',
        :season_type_id => mas_fin_id, :federation_code => 'C', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M30', :age_begin => 30, :age_end => 34, :description => 'MASTER 30', :short_name => 'M30',
        :season_type_id => mas_fin_id, :federation_code => 'D', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M35', :age_begin => 35, :age_end => 39, :description => 'MASTER 35', :short_name => 'M35',
        :season_type_id => mas_fin_id, :federation_code => 'E', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M40', :age_begin => 40, :age_end => 44, :description => 'MASTER 40', :short_name => 'M40',
        :season_type_id => mas_fin_id, :federation_code => 'F', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M45', :age_begin => 45, :age_end => 49, :description => 'MASTER 45', :short_name => 'M45',
        :season_type_id => mas_fin_id, :federation_code => 'G', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M50', :age_begin => 50, :age_end => 54, :description => 'MASTER 50', :short_name => 'M50',
        :season_type_id => mas_fin_id, :federation_code => 'H', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M55', :age_begin => 55, :age_end => 59, :description => 'MASTER 55', :short_name => 'M55',
        :season_type_id => mas_fin_id, :federation_code => 'I', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M60', :age_begin => 60, :age_end => 64, :description => 'MASTER 60', :short_name => 'M60',
        :season_type_id => mas_fin_id, :federation_code => 'J', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M65', :age_begin => 65, :age_end => 69, :description => 'MASTER 65', :short_name => 'M65',
        :season_type_id => mas_fin_id, :federation_code => 'K', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M70', :age_begin => 70, :age_end => 74, :description => 'MASTER 70', :short_name => 'M70',
        :season_type_id => mas_fin_id, :federation_code => 'L', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M75', :age_begin => 75, :age_end => 79, :description => 'MASTER 75', :short_name => 'M75',
        :season_type_id => mas_fin_id, :federation_code => 'M', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M80', :age_begin => 80, :age_end => 84, :description => 'MASTER 80', :short_name => 'M80',
        :season_type_id => mas_fin_id, :federation_code => 'N', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M85', :age_begin => 85, :age_end => 89, :description => 'MASTER 85', :short_name => 'M85',
        :season_type_id => mas_fin_id, :federation_code => 'O', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M90', :age_begin => 90, :age_end => 94, :description => 'MASTER 90', :short_name => 'M90',
        :season_type_id => mas_fin_id, :federation_code => 'P', :group_name => 'MASTER', :is_a_relay => false },
      { :code => 'M95', :age_begin => 95, :age_end => 999, :description => 'MASTER 95', :short_name => 'M95',
        :season_type_id => mas_fin_id, :federation_code => 'Q', :group_name => 'MASTER', :is_a_relay => false },

      { :code => 'M100', :age_begin => 100, :age_end => 119, :description => 'STAFF. M100-119', :short_name => 'M100-119',
        :season_type_id => mas_fin_id, :federation_code => 'xA', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M120', :age_begin => 120, :age_end => 139, :description => 'STAFF. M120-139', :short_name => 'M120-139',
        :season_type_id => mas_fin_id, :federation_code => 'xB', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M140', :age_begin => 140, :age_end => 159, :description => 'STAFF. M140-159', :short_name => 'M140-159',
        :season_type_id => mas_fin_id, :federation_code => 'xC', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M160', :age_begin => 160, :age_end => 179, :description => 'STAFF. M160-179', :short_name => 'M160-179',
        :season_type_id => mas_fin_id, :federation_code => 'xD', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M180', :age_begin => 180, :age_end => 199, :description => 'STAFF. M180-199', :short_name => 'M180-199',
        :season_type_id => mas_fin_id, :federation_code => 'xE', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M200', :age_begin => 200, :age_end => 219, :description => 'STAFF. M200-219', :short_name => 'M200-219',
        :season_type_id => mas_fin_id, :federation_code => 'xF', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M220', :age_begin => 220, :age_end => 239, :description => 'STAFF. M220-239', :short_name => 'M220-239',
        :season_type_id => mas_fin_id, :federation_code => 'xG', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M240', :age_begin => 240, :age_end => 259, :description => 'STAFF. M240-259', :short_name => 'M240-259',
        :season_type_id => mas_fin_id, :federation_code => 'xH', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M260', :age_begin => 260, :age_end => 279, :description => 'STAFF. M260-279', :short_name => 'M260-279',
        :season_type_id => mas_fin_id, :federation_code => 'xI', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M280', :age_begin => 280, :age_end => 299, :description => 'STAFF. M280-299', :short_name => 'M280-299',
        :season_type_id => mas_fin_id, :federation_code => 'xJ', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M300', :age_begin => 300, :age_end => 319, :description => 'STAFF. M300-319', :short_name => 'M300-319',
        :season_type_id => mas_fin_id, :federation_code => 'xK', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M320', :age_begin => 320, :age_end => 339, :description => 'STAFF. M320-339', :short_name => 'M320-339',
        :season_type_id => mas_fin_id, :federation_code => 'xL', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M340', :age_begin => 340, :age_end => 359, :description => 'STAFF. M340-359', :short_name => 'M340-359',
        :season_type_id => mas_fin_id, :federation_code => 'xM', :group_name => 'MASTER', :is_a_relay => true },
      { :code => 'M360', :age_begin => 360, :age_end => 400, :description => 'STAFF. M360-...', :short_name => 'M360-...',
        :season_type_id => mas_fin_id, :federation_code => 'xN', :group_name => 'MASTER', :is_a_relay => true },

      { :code => 'C2',  :age_begin => 9, :age_end => 9, :description => 'ESORDIENTI C', :short_name => 'ESO C',
        :season_type_id => ago_fin_id, :federation_code => 'C', :group_name => 'ESORDIENTI C', :is_a_relay => false },
      { :code => 'B1',  :age_begin => 10, :age_end => 10, :description => 'ESORDIENTI B1', :short_name => 'ESO B1',
        :season_type_id => ago_fin_id, :federation_code => 'P', :group_name => 'ESORDIENTI B', :is_a_relay => false },
      { :code => 'B2',  :age_begin => 11, :age_end => 11, :description => 'ESORDIENTI B2', :short_name => 'ESO B2',
        :season_type_id => ago_fin_id, :federation_code => 'B', :group_name => 'ESORDIENTI B', :is_a_relay => false },
      { :code => 'A1',  :age_begin => 12, :age_end => 12, :description => 'ESORDIENTI A1', :short_name => 'ESO A1',
        :season_type_id => ago_fin_id, :federation_code => 'A', :group_name => 'ESORDIENTI A', :is_a_relay => false },
      { :code => 'A2',  :age_begin => 13, :age_end => 13, :description => 'ESORDIENTI A2', :short_name => 'ESO A2',
        :season_type_id => ago_fin_id, :federation_code => 'H', :group_name => 'ESORDIENTI A', :is_a_relay => false },
      { :code => 'R1',  :age_begin => 14, :age_end => 14, :description => 'RAGAZZI 1', :short_name => 'RAG 1',
        :season_type_id => ago_fin_id, :federation_code => 'Q', :group_name => 'RAGAZZI', :is_a_relay => false },
      { :code => 'R2',  :age_begin => 15, :age_end => 15, :description => 'RAGAZZI 2', :short_name => 'RAG 2',
        :season_type_id => ago_fin_id, :federation_code => 'T', :group_name => 'RAGAZZI', :is_a_relay => false },
      { :code => 'R3',  :age_begin => 16, :age_end => 16, :description => 'RAGAZZI 3', :short_name => 'RAG 3',
        :season_type_id => ago_fin_id, :federation_code => 'R', :group_name => 'RAGAZZI', :is_a_relay => false },
      { :code => 'J1',  :age_begin => 17, :age_end => 17, :description => 'JUNIORES 1', :short_name => 'JUN 1',
        :season_type_id => ago_fin_id, :federation_code => 'I', :group_name => 'JUNIORES', :is_a_relay => false },
      { :code => 'J2',  :age_begin => 18, :age_end => 18, :description => 'JUNIORES 2', :short_name => 'JUN 2',
        :season_type_id => ago_fin_id, :federation_code => 'J', :group_name => 'JUNIORES', :is_a_relay => false },
      { :code => 'CAD', :age_begin => 19, :age_end => 19, :description => 'CADETTI', :short_name => 'CAD',
        :season_type_id => ago_fin_id, :federation_code => 'K', :group_name => 'CADETTI', :is_a_relay => false },
      { :code => 'ASS', :age_begin => 20, :age_end => 999, :description => 'ASSOLUTI', :short_name => 'ASS',
        :season_type_id => ago_fin_id, :federation_code => 'S', :group_name => 'ASSOLUTI', :is_a_relay => false },

      { :code => 'PUL', :age_begin => 9, :age_end => 10, :description => 'PULCINI', :short_name => 'PUL',
        :season_type_id => ago_csi_id, :federation_code => '1', :group_name => 'PULCINI', :is_a_relay => false },
      { :code => 'GIO', :age_begin => 11, :age_end => 12, :description => 'GIOVANISSIMI', :short_name => 'GIO',
        :season_type_id => ago_csi_id, :federation_code => '2', :group_name => 'GIOVANISSIMI', :is_a_relay => false },
      { :code => 'RAG', :age_begin => 13, :age_end => 14, :description => 'RAGAZZI', :short_name => 'RAG',
        :season_type_id => ago_csi_id, :federation_code => '3', :group_name => 'RAGAZZI', :is_a_relay => false },
      { :code => 'ALL', :age_begin => 15, :age_end => 16, :description => 'ALLIEVI', :short_name => 'ALL',
        :season_type_id => ago_csi_id, :federation_code => '4', :group_name => 'ALLIEVI', :is_a_relay => false },
      { :code => 'ASS', :age_begin => 17, :age_end => 999, :description => 'ASSOLUTI', :short_name => 'ASS',
        :season_type_id => ago_csi_id, :federation_code => '5', :group_name => 'ASSOLUTI', :is_a_relay => false }
    ]
    begin
      CategoryType.transaction do                   # -- START TRANSACTION --
        category_types.each { |hash|
          say "Adding tuple (code='#{hash[:code]}', season_type=#{hash[:season_type_id]})..."
          category_type = CategoryType.new({
            :season_type_id => hash[:season_type_id],
            :code => hash[:code],
            :age_begin => hash[:age_begin], :age_end => hash[:age_end],
            :description => hash[:description], :short_name => hash[:short_name],
            :federation_code => hash[:federation_code], :group_name => hash[:group_name]
          })
          category_type.save!                       # raise automatically an exception if save is not successful
        }
      end                                           # -- END TRANSACTION --
    end
    say 'Verifying CategoryType rows existence...'
    category_types.each { |hash|
      raise "CategoryType with (code='#{hash[:code]}', season_type=#{hash[:season_type_id]}) not found!\r\n" unless CategoryType.exists?( :code => hash[:code], :season_type_id => hash[:season_type_id] )
      say "CategoryType tuple (code='#{hash[:code]}', season_type=#{hash[:season_type_id]}) found."
    }


    say 'Adding ShowerType default data...'
    ShowerType.transaction do                       # -- START TRANSACTION --
      ShowerType::TYPES_HASH.each { |key, code|
        ShowerType.create( { :id => key, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying ShowerType rows existence...'
    ShowerType::TYPES_HASH.each { |key, code|
      raise "ShowerType with code #{code} not found!" unless ShowerType.find_by_code( code )
      say "Tuple (ID #{key}, Code '#{code}') found."
    }


    say 'Adding LockerCabinetType default data...'
    LockerCabinetType.transaction do                       # -- START TRANSACTION --
      LockerCabinetType::TYPES_HASH.each { |key, code|
        LockerCabinetType.create( { :id => key, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying LockerCabinetType rows existence...'
    LockerCabinetType::TYPES_HASH.each { |key, code|
      raise "LockerCabinetType with code #{code} not found!" unless LockerCabinetType.find_by_code( code )
      say "Tuple (ID #{key}, Code '#{code}') found."
    }


    say 'Adding HairDryerType default data...'
    HairDryerType.transaction do                       # -- START TRANSACTION --
      HairDryerType::TYPES_HASH.each { |key, code|
        HairDryerType.create( { :id => key, :code => code } )
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying HairDryerType rows existence...'
    HairDryerType::TYPES_HASH.each { |key, code|
      raise "HairDryerType with code #{code} not found!" unless HairDryerType.find_by_code( code )
      say "Tuple (ID #{key}, Code '#{code}') found."
    }

    say 'Done.'
  end
  # ---------------------------------------------------------------------------


  def down
    say 'Deleting default data for HairDryerType...'
    HairDryerType.delete_all
    say 'Deleting default data for LockerCabinetType...'
    LockerCabinetType.delete_all
    say 'Deleting default data for ShowerType...'
    ShowerType.delete_all

    say 'Deleting default data for CategoryType...'
    CategoryType.delete_all
    say 'Deleting default data for EventType...'
    EventType.delete_all
    say 'Deleting default data for StrokeType...'
    StrokeType.delete_all
    say 'Deleting default data for SeasonType...'
    SeasonType.delete_all
    say 'Deleting default data for FederationType...'
    FederationType.delete_all
    say 'Deleting default data for PresenceType...'
    PresenceType.delete_all
    say 'Deleting default data for GenderType...'
    GenderType.delete_all
    say 'Deleting default data for PoolType...'
    PoolType.delete_all

    say 'Done.'
  end
  # ---------------------------------------------------------------------------
end
