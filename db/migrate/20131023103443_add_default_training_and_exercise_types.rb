class AddDefaultTrainingAndExerciseTypes < ActiveRecord::Migration
  def up
    say 'Adding MovementType default data...'
    # [Steve, 20131023] ER-SQL source:
    # INSERT INTO movement_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'C',0,CURDATE(),CURDATE()),
    # (2,'G',0,CURDATE(),CURDATE()),
    # (3,'B',0,CURDATE(),CURDATE());
    movement_types = [
      { :id => 1, :code => 'C' },
      { :id => 2, :code => 'G' },
      { :id => 3, :code => 'B' }
    ]
    MovementType.transaction do                     # -- START TRANSACTION --
      movement_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        MovementType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying MovementType rows existence...'
    movement_types.each { |hash|
      raise "MovementType with code #{hash[:code]} not found!" unless MovementType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding MovementScopeType default data...'
    # INSERT INTO movement_scope_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'I',0,CURDATE(),CURDATE()),
    # (2,'E',0,CURDATE(),CURDATE()),
    # (3,'N',0,CURDATE(),CURDATE()),
    # (4,'C',0,CURDATE(),CURDATE());
    movement_scope_types = [
      { :id => 1, :code => 'I' },
      { :id => 2, :code => 'E' },
      { :id => 3, :code => 'N' },
      { :id => 4, :code => 'C' }
    ]
    MovementScopeType.transaction do                # -- START TRANSACTION --
      movement_scope_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        MovementScopeType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying MovementScopeType rows existence...'
    movement_scope_types.each { |hash|
      raise "MovementScopeType with code #{hash[:code]} not found!" unless MovementScopeType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding TrainingModeType default data...'
    # INSERT INTO training_mode_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'A1',0,CURDATE(),CURDATE()),
    # (2,'A2',0,CURDATE(),CURDATE()),
    # (3,'B1',0,CURDATE(),CURDATE()),
    # (4,'B2',0,CURDATE(),CURDATE()),
    # (5,'C1',0,CURDATE(),CURDATE()),
    # (6,'C2',0,CURDATE(),CURDATE()),
    # (7,'C3',0,CURDATE(),CURDATE());
    training_mode_types = [
      { :id => 1, :code => 'A1' },
      { :id => 2, :code => 'A2' },
      { :id => 3, :code => 'B1' },
      { :id => 4, :code => 'B2' },
      { :id => 5, :code => 'C1' },
      { :id => 6, :code => 'C2' },
      { :id => 7, :code => 'C3' }
    ]
    TrainingModeType.transaction do                 # -- START TRANSACTION --
      training_mode_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        TrainingModeType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying TrainingModeType rows existence...'
    training_mode_types.each { |hash|
      raise "TrainingModeType with code #{hash[:code]} not found!" unless TrainingModeType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding BodyAuxType default data...'
    # INSERT INTO body_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'M',0,CURDATE(),CURDATE()),
    # (2,'C',0,CURDATE(),CURDATE()),
    # (3,'S',0,CURDATE(),CURDATE()),
    # (4,'E',0,CURDATE(),CURDATE()),
    # (5,'T',0,CURDATE(),CURDATE());
    body_aux_types = [
      { :id => 1, :code => 'M' },
      { :id => 2, :code => 'C' },
      { :id => 3, :code => 'S' },
      { :id => 4, :code => 'E' },
      { :id => 5, :code => 'T' }
    ]
    BodyAuxType.transaction do                      # -- START TRANSACTION --
      body_aux_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        BodyAuxType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying BodyAuxType rows existence...'
    body_aux_types.each { |hash|
      raise "BodyAuxType with code #{hash[:code]} not found!" unless BodyAuxType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding BreathAuxType default data...'
    # INSERT INTO breath_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'S',0,CURDATE(),CURDATE()),
    # (2,'B',0,CURDATE(),CURDATE());
    breath_aux_types = [
      { :id => 1, :code => 'S' },
      { :id => 2, :code => 'B' }
    ]
    BreathAuxType.transaction do                    # -- START TRANSACTION --
      breath_aux_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        BreathAuxType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying BreathAuxType rows existence...'
    breath_aux_types.each { |hash|
      raise "BreathAuxType with code #{hash[:code]} not found!" unless BreathAuxType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding ArmAuxType default data...'
    # INSERT INTO arm_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'P',0,CURDATE(),CURDATE()),
    # (2,'H',0,CURDATE(),CURDATE()),
    # (3,'G',0,CURDATE(),CURDATE()),
    # (4,'8',0,CURDATE(),CURDATE());
    arm_aux_types = [
      { :id => 1, :code => 'P' },
      { :id => 2, :code => 'H' },
      { :id => 3, :code => 'G' },
      { :id => 4, :code => '8' }
    ]
    ArmAuxType.transaction do                       # -- START TRANSACTION --
      arm_aux_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        ArmAuxType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying ArmAuxType rows existence...'
    arm_aux_types.each { |hash|
      raise "ArmAuxType with code #{hash[:code]} not found!" unless ArmAuxType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding KickAuxType default data...'
    # INSERT INTO kick_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'L',0,CURDATE(),CURDATE()),
    # (2,'C',0,CURDATE(),CURDATE()),
    # (3,'M',0,CURDATE(),CURDATE()),
    # (4,'P',0,CURDATE(),CURDATE()),
    # (5,'E',0,CURDATE(),CURDATE()),
    # (6,'T',0,CURDATE(),CURDATE());
    kick_aux_types = [
      { :id => 1, :code => 'L' },
      { :id => 2, :code => 'C' },
      { :id => 3, :code => 'M' },
      { :id => 4, :code => 'P' },
      { :id => 5, :code => 'E' },
      { :id => 6, :code => 'T' }
    ]
    KickAuxType.transaction do                      # -- START TRANSACTION --
      kick_aux_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        KickAuxType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying KickAuxType rows existence...'
    kick_aux_types.each { |hash|
      raise "KickAuxType with code #{hash[:code]} not found!" unless KickAuxType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }


    say 'Adding TrainingStepType default data...'
    # INSERT INTO training_step_types (id,code,lock_version,created_at,updated_at) VALUES 
    # (1,'R',0,CURDATE(),CURDATE()),
    # (2,'T',0,CURDATE(),CURDATE()),
    # (3,'A',0,CURDATE(),CURDATE()),
    # (4,'C',0,CURDATE(),CURDATE()),
    # (5,'D',0,CURDATE(),CURDATE());
    training_step_types = [
      { :id => 1, :code => 'R' },
      { :id => 2, :code => 'T' },
      { :id => 3, :code => 'A' },
      { :id => 4, :code => 'C' },
      { :id => 5, :code => 'D' }
    ]
    TrainingStepType.transaction do                 # -- START TRANSACTION --
      training_step_types.each { |hash|
        say "Adding code '#{hash[:code]}'..."
        TrainingStepType.create({ :id => hash[:id], :code => hash[:code] })
      }
    end                                             # -- END TRANSACTION --
    say 'Verifying TrainingStepType rows existence...'
    training_step_types.each { |hash|
      raise "TrainingStepType with code #{hash[:code]} not found!" unless TrainingStepType.find_by_code( hash[:code] )
      say "Code '#{hash[:code]}' found."
    }
  end
  # ---------------------------------------------------------------------------


  def down
    say 'Deleting default data for MovementType...'
    MovementType.delete_all
    say 'Deleting default data for MovementScopeType...'
    MovementScopeType.delete_all
    say 'Deleting default data for TrainingModeType...'
    TrainingModeType.delete_all

    say 'Deleting default data for BodyAuxType...'
    BodyAuxType.delete_all
    say 'Deleting default data for BreathAuxType...'
    BreathAuxType.delete_all
    say 'Deleting default data for ArmAuxType...'
    ArmAuxType.delete_all
    say 'Deleting default data for TrainingStepType...'
    KickAuxType.delete_all
    say 'Deleting default data for KickAuxType...'
    TrainingStepType.delete_all
  end
  # ---------------------------------------------------------------------------
end
