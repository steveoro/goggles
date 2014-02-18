class AddAuxReferencesToTrainingRows < ActiveRecord::Migration
  def change
    change_table :training_rows do |t|
      t.references :arm_aux_type
      t.references :kick_aux_type
      t.references :body_aux_type
      t.references :breath_aux_type
    end
  end
end
