-- Leega
-- 15/04/2016
-- Add Paolo Orestilli as Multisport scsd referent

update teams 
set home_page_url = 'https://mastermultisport.wordpress.com/',
	e_mail = 'paoloorestilli@gmail.com',
	contact_name = 'Paolo Orestilli'
where id = 825;

/*
select * from teams t where t.id = 825;
*/