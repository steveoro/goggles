# encoding: utf-8

class CreateDisqualificationCodeTypes < ActiveRecord::Migration
  def up
    # FINA disqualification codes, most in use (and not) upto Season 2013-2014.
    # Note that we must keep also the obsolete ones for compatibility reasons.
    create_table :disqualification_code_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 4, :null => false
      t.boolean :is_a_relay, :null => false, :default => false

      # [Steve+Leega, 20131007] Stroke type for which the disqualification applies.
      # When not present, this disqualification code can be applied to any stroke type
      # ('general' disqualification code) or to the relay heats. 
      t.references :stroke_type
    end

    add_index :disqualification_code_types, [:is_a_relay, :code], name: :code, :unique => true
    add_index :disqualification_code_types, :is_a_relay
  end
  # ---------------------------------------------------------------------------


  def down
    drop_table :disqualification_code_types
  end
  # ---------------------------------------------------------------------------
end
