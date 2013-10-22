class CreateBreathAuxTypes < ActiveRecord::Migration
  def change
    create_table :breath_aux_types do |t|

      t.timestamps
    end
  end
end
