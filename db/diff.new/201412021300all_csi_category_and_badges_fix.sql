-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix category definitions (Seniores and M20)
update category_types set age_end = 19 where id = 821;
update category_types set age_begin = 20 where id = 822;
commit;

-- Move badges into right categories (Seniores)
update badges set category_type_id = 821 where id in
(8124,
8140,
8145,
8146,
8148,
8155,
8157,
8161,
8162,
8163,
8164,
8166,
8167,
8169,
8173,
8259,
8260,
8261,
8262,
8263,
8264,
8265,
8268,
8269,
8270,
8274,
8277,
8279,
8281,
8327,
8328,
8329,
8335,
8337,
8381,
8384,
8393,
8394);

COMMIT;
-- Fine script
