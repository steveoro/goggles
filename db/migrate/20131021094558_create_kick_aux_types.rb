class CreateKickAuxTypes < ActiveRecord::Migration
  def change
    create_table :kick_aux_types do |t|

      t.timestamps
    end
  end
end
