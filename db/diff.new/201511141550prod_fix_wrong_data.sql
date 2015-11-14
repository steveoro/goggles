-- Leega
-- CSI Nuoto Ober Ferarri Goggle Cup end dates
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Update wrong goggle cup standard time for 50FA-50 LIGABUE MARCO
update goggle_cup_standards set hundreds = 24 where id = 8601;

-- Update swimming pool facilities for Nannini - Firenze
update swimming_pools set 
	has_bar = true, 
	has_multiple_pools = true, 
	has_open_area = true,
	shower_type_id = (select st.id from shower_types st where st.code = 'G'),
	hair_dryer_type_id = (select hdt.id from hair_dryer_types hdt where hdt.code = 'U'),
	locker_cabinet_type_id = (select lct.id from locker_cabinet_types lct where lct.code = 'P')
where nick_name like 'firenzenannini%';

COMMIT;
-- End script