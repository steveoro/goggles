-- Fix errori di caricamento stagione FIN 132 - Swimming pool
-- TODO review genovanp258_bis and pescaranp258_bis to find if same pool of genovanp258 and pescaranp258
UPDATE swimming_pools sp SET sp.nick_name = 'genovanp258_bis', sp.pool_type_id = (select pt.id from pool_types pt where pt.length_in_meters = 25) WHERE sp.nick_name = 'genovanp288';
UPDATE swimming_pools sp SET sp.nick_name = 'poggibonsinp256', sp.pool_type_id = (select pt.id from pool_types pt where pt.length_in_meters = 25) WHERE sp.nick_name = 'poggibonsinp266';
UPDATE swimming_pools sp SET sp.nick_name = 'pescaranp258_bis', sp.pool_type_id = (select pt.id from pool_types pt where pt.length_in_meters = 25) WHERE sp.nick_name = 'pescaranp358';
commit;