class CreateArmAuxTypes < ActiveRecord::Migration
  def change
    create_table :arm_aux_types do |t|

      t.timestamps
    end
  end
end
