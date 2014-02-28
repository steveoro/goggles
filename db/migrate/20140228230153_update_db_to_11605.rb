class UpdateDbTo11605 < ActiveRecord::Migration
  def up
    AppParameter.update(
      AppParameter::PARAM_VERSIONING_CODE,
      AppParameter::PARAM_APP_NAME_FIELD.to_sym => Version::FULL,
      AppParameter::PARAM_DB_VERSION_FIELD.to_sym => '1.16.05'
    )
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
