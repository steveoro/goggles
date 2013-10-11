class AddDisqualificationCodeTypes < ActiveRecord::Migration
  def up
    say 'Adding default DisqualificationCodeType(s)...'
    execute <<-SQL
      INSERT INTO disqualification_code_types (id,code,is_a_relay,stroke_type_id,lock_version,created_at,updated_at) VALUES 
      (1,'GA',0,0,0,CURDATE(),CURDATE()),
      (2,'GB',0,0,0,CURDATE(),CURDATE()),
      (3,'GC',0,0,0,CURDATE(),CURDATE()),
      (4,'GD',0,0,0,CURDATE(),CURDATE()),
      (5,'GE',0,0,0,CURDATE(),CURDATE()),
      (6,'GF',0,0,0,CURDATE(),CURDATE()),
      (7,'GG',0,0,0,CURDATE(),CURDATE()),
      (8,'GH',0,0,0,CURDATE(),CURDATE()),
      (9,'GI',0,0,0,CURDATE(),CURDATE()),
      (10,'GJ',0,0,0,CURDATE(),CURDATE()),
      (11,'GK',0,0,0,CURDATE(),CURDATE()),
      (12,'GL',0,0,0,CURDATE(),CURDATE()),
      (13,'GM',0,0,0,CURDATE(),CURDATE()),
      (14,'BaA',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (15,'BaB',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (16,'BaC',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (17,'BaD',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (18,'BaE',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (19,'BaF',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (20,'BaG',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (21,'BaH',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (22,'BaI',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
      (23,'BfA',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (24,'BfB',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (25,'BfC',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (26,'BfD',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (27,'BfE',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (28,'BfF',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (29,'BfG',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (30,'BfH',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (31,'BfI',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
      (32,'BrA',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (33,'BrB',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (34,'BrC',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (35,'BrD',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (36,'BrE',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (37,'BrF',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (38,'BrG',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (39,'BrH',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (40,'BrI',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (41,'BrJ',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (42,'BrK',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (43,'BrL',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
      (44,'FrA',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
      (45,'FrB',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
      (46,'FrC',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
      (47,'IMA',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
      (48,'IMB',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
      (49,'IMC',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
      (50,'RA2',1,0,0,CURDATE(),CURDATE()),
      (51,'RA3',1,0,0,CURDATE(),CURDATE()),
      (52,'RA4',1,0,0,CURDATE(),CURDATE()),
      (53,'RB',1,0,0,CURDATE(),CURDATE()),
      (54,'RC',1,0,0,CURDATE(),CURDATE()),
      (55,'RD',1,0,0,CURDATE(),CURDATE()),
      (56,'RE1',1,0,0,CURDATE(),CURDATE()),
      (57,'RE2',1,0,0,CURDATE(),CURDATE()),
      (58,'RE3',1,0,0,CURDATE(),CURDATE()),
      (59,'RE4',1,0,0,CURDATE(),CURDATE()),
      (60,'RF',1,0,0,CURDATE(),CURDATE())
    SQL
  end
  # ---------------------------------------------------------------------------

  def down
    say 'Deleting all DisqualificationCodeType(s)...'
    DisqualificationCodeType.delete_all
  end
  # ---------------------------------------------------------------------------
end
