-- Aggiunta esercizio (e movimento)
-- Gli ID sono forzati in quanto unico aggiornatore.

-- Base movements
INSERT INTO base_movements (id,code,user_id,is_arm_aux_allowed,is_kick_aux_allowed,is_body_aux_allowed,is_breath_aux_allowed,stroke_type_id,movement_type_id,movement_scope_type_id,lock_version,created_at,updated_at) VALUES 
(146,'RABRSL',2,0,0,0,0,(select t.id from stroke_types t where t.code = 'RA'),(select t.id from movement_types t where t.code = 'C'),(select t.id from movement_scope_types t where t.code = 'C'),0,CURDATE(),CURDATE());

-- Exercises
INSERT INTO exercises (id,code,user_id,training_step_type_codes,lock_version,created_at,updated_at) VALUES 
(311,'ESRAGS',2,'T',0,CURDATE(),CURDATE());

-- Exercise rows
INSERT INTO exercise_rows (id,part_order,percentage,distance,start_and_rest,pause,exercise_id,base_movement_id,training_mode_type_id,execution_note_type_id,lock_version,created_at,updated_at) VALUES 
(426,1,100,0,0,0,(select t.id from exercises t where t.code = 'ESRAGS'),(select t.id from base_movements t where t.code = 'RABRSL'),(select t.id from training_mode_types t where t.code = 'A1'),(select t.id from execution_note_types t where t.code = ''),0,CURDATE(),CURDATE());

commit;