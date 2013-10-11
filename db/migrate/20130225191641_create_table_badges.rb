class CreateTableBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :lock_version, :default => 0
      t.string :number, :limit => 40, :null => false

      t.references :season
      t.references :swimmer
      t.references :team
      t.references :category_type
      # [Steve, 20130924] accreditation_time_type is used as a (default) user-preference
      # for time accreditation during meeting registration. Since it can change
      # on a user/season basis, the reference is on the  badge.
      t.references :accreditation_time_type

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :badges, :number
  end
  # ---------------------------------------------------------------------------
end
