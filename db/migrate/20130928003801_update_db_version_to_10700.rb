class UpdateDbVersionTo10700 < ActiveRecord::Migration
  def up
    AppParameter.update(
      AppParameter::PARAM_VERSIONING_CODE,
      AppParameter::PARAM_APP_NAME_FIELD.to_sym => Version::FULL,
      AppParameter::PARAM_DB_VERSION_FIELD.to_sym => '1.07.01'
    )
  end
  # ---------------------------------------------------------------------------


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
