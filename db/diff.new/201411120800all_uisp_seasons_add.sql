-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella seasons
-- 
INSERT INTO seasons (id,description,edition,header_year,begin_date,end_date,season_type_id,timing_type_id,edition_type_id,lock_version,created_at,updated_at) VALUES 
(45,'Circuito Regionale Emilia master UISP 2004/2005',1,'2004/2005','2004-11-21','2005-06-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(55,'Circuito Regionale Emilia master UISP 2005/2006',2,'2005/2006','2005-11-06','2006-09-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(65,'Circuito Regionale Emilia master UISP 2006/2007',3,'2006/2007','2006-11-19','2007-08-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(75,'Circuito Regionale Emilia master UISP 2007/2008',4,'2007/2008','2007-11-18','2008-06-07',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(85,'Circuito Regionale Emilia master UISP 2008/2009',5,'2008/2009','2008-11-23','2009-06-14',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(95,'Circuito Regionale Emilia master UISP 2009/2010',6,'2009/2010','2009-11-15','2010-06-15',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(105,'Circuito Regionale Emilia master UISP 2010/2011',7,'2010/2011','2010-11-14','2011-06-15',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(115,'Circuito Regionale Emilia master UISP 2011/2012',8,'2011/2012','2011-11-06','2012-02-15',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(125,'Circuito Regionale Emilia master UISP 2012/2013',9,'2012/2013','2012-11-04','2013-09-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(135,'Circuito Regionale Emilia master UISP 2013/2014',10,'2013/2014','2013-10-01','2014-09-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE()),
(145,'Circuito regionale Emilia master UISP 2014/2015',11,'2014/2015','2014-10-01','2015-09-30',(select t.id from season_types t where t.code = 'MASUISP'),(select t.id from timing_types t where t.code = 'S'),(select t.id from edition_types t where t.code = 'S'),0,CURDATE(),CURDATE());

COMMIT;
-- Fine script