/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Add undivided flag to "assoluti" categories
update category_types set is_undivided = true where id = 934;
update category_types set is_undivided = true where federation_code = 'xX';

commit;