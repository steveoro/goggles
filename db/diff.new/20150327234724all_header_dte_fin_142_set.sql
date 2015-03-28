-- Set header date for known meetings of 142 season
update meetings m set m.header_date = '2015-02-22' where m.id = 14207;
update meetings m set m.header_date = '2015-06-24' where m.id = 14211;

commit;
