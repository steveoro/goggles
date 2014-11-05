-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Correzione codici meeting per renderli univoci
-- 
update meetings m set m.code = 'solidarieta' where m.description like '%SOLIDARIETÀ%';
update meetings m set m.code = 'costoli' where m.description like '%COSTOLI%';
update meetings m set m.code = 'blueteam' where m.description like '%BLUE TEAM%';
update meetings m set m.code = 'cloro' where m.description like '%GIORNI DI CLORO%';
update meetings m set m.code = 'ostia' where m.description like '%BRUNELLESCHI%';
update meetings m set m.code = 'mercatino' where m.description like '%MERCATINO%';
update meetings m set m.code = 'leonessa' where m.description like '%LEONESSA%';
update meetings m set m.code = 'mussi' where m.description like '%MUSSI%' and m.description like '%LOMBARDI%';
update meetings m set m.code = 'dolomiti' where m.description like '%DOLOMITI%';
update meetings m set m.code = 'brixia' where m.description like '%BRIXIA FIDELIS%';
update meetings m set m.code = 'immota' where m.description like '%IMMOTA MANET%';
update meetings m set m.code = 'buonconsiglio' where m.description like '%BUONCONSIGLIO%';
update meetings m set m.code = 'primavera' where m.description like '%MASTER DI PRIMAVERA%';
update meetings m set m.code = 'nuovonuoto' where m.description like '%NUOVO%' and m.description like '%NUOTO%';
update meetings m set m.code = 'corda' where m.description like '%ANDREA CORDA%';
update meetings m set m.code = 'buonnatale' where m.description like '%BUON NATALE%';
update meetings m set m.code = 'forum' where m.description like '%FORUM SPRINT%';
update meetings m set m.code = 'sagata' where m.description like '%S. AGATA%';
update meetings m set m.code = 'etna' where m.description like '%ETNA NUOTO%';
update meetings m set m.code = 'pinto' where m.description like '%PAOLO PINTO%';
update meetings m set m.code = 'aniene' where m.description like '%ANIENE%';
update meetings m set m.code = 'flaminio' where m.description like '%FLAMINIO%';
update meetings m set m.code = 'cattarinich' where m.description like '%CATTARINICH%';
update meetings m set m.code = 'ponente' where m.description like '%NUOTO PONENTE%';
update meetings m set m.code = 'mysport' where m.description like '%MY SPORT%';
update meetings m set m.code = 'repubblica' where m.description like '%REPUBBLICA%' and m.description like '%MARINO%';
update meetings m set m.code = 'repubblica' where m.description like '%MEETING CITTA%' and m.description like '%DI SAN MARINO%';
update meetings m set m.code = 'agosti' where m.description like '%MEMORIAL AGOSTI%';
update meetings m set m.code = 'crocera' where m.description like '%CROCERA%';

COMMIT;
-- Fine script
