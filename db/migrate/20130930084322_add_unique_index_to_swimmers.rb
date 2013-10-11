class AddUniqueIndexToSwimmers < ActiveRecord::Migration
  def up
    remove_index :swimmers, :name => :name_and_nick
    add_index :swimmers, [:complete_name, :year_of_birth], :name => :name_and_year, :unique => true

    AppParameter.update(
      AppParameter::PARAM_VERSIONING_CODE,
      AppParameter::PARAM_APP_NAME_FIELD.to_sym => Version::FULL,
      AppParameter::PARAM_DB_VERSION_FIELD.to_sym => '1.07.02'
    )
  end
  # ---------------------------------------------------------------------------


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
