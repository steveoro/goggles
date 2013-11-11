--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('CENTRO NUOTO BASTIA',13,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,13,'CENTRO NUOTO BASTIA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RN LEGNANO','RN LEGNANO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RN LEGNANO'),'RN LEGNANO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CN UISP BOLOGNA','CN UISP BOLOGNA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CN UISP BOLOGNA'),'CN UISP BOLOGNA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('MASTER AICS BRESCIA','MASTER AICS BRESCIA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'MASTER AICS BRESCIA'),'MASTER AICS BRESCIA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AMICI DEL NUOTO FIR','AMICI DEL NUOTO FIR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AMICI DEL NUOTO FIR'),'AMICI DEL NUOTO FIR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POL COM RICCIONE','POL COM RICCIONE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POL COM RICCIONE'),'POL COM RICCIONE','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('NUOTO CLUB 2000',29,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,29,'NUOTO CLUB 2000','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ESCHILO FITNESS S.S','ESCHILO FITNESS S.S','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ESCHILO FITNESS S.S'),'ESCHILO FITNESS S.S','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RINASCITA TEAM ROMA','RINASCITA TEAM ROMA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RINASCITA TEAM ROMA'),'RINASCITA TEAM ROMA','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('AS PESARO NUOTO',2,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,2,'AS PESARO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('N MODENESI','N MODENESI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'N MODENESI'),'N MODENESI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SAN MARINO MASTER','SAN MARINO MASTER','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SAN MARINO MASTER'),'SAN MARINO MASTER','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SPORT MANAGEMENT SR','SPORT MANAGEMENT SR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SPORT MANAGEMENT SR'),'SPORT MANAGEMENT SR','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('SEVEN MASTER NUOTO',28,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,28,'SEVEN MASTER NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TEAM MARCHE MASTER','TEAM MARCHE MASTER','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TEAM MARCHE MASTER'),'TEAM MARCHE MASTER','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('MODENA NUOTO',15,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,15,'MODENA NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('COOPERNUOTO','COOPERNUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'COOPERNUOTO'),'COOPERNUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AMATORI NUOTO LIB','AMATORI NUOTO LIB','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AMATORI NUOTO LIB'),'AMATORI NUOTO LIB','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('STILELIBERO SRL SSD','STILELIBERO SRL SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'STILELIBERO SRL SSD'),'STILELIBERO SRL SSD','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('CSI NUOTO OBER FERR',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,1,'CSI NUOTO OBER FERR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AQUATIC TEAM RAVENN','AQUATIC TEAM RAVENN','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AQUATIC TEAM RAVENN'),'AQUATIC TEAM RAVENN','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FANUM FORTUNAE ASD','FANUM FORTUNAE ASD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FANUM FORTUNAE ASD'),'FANUM FORTUNAE ASD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FIRENZE NUOTA MASTE','FIRENZE NUOTA MASTE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FIRENZE NUOTA MASTE'),'FIRENZE NUOTA MASTE','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CAN ANIENE','CAN ANIENE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CAN ANIENE'),'CAN ANIENE','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('VELA NUOTO ANCONA','VELA NUOTO ANCONA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'VELA NUOTO ANCONA'),'VELA NUOTO ANCONA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TORINO NUOTO','TORINO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TORINO NUOTO'),'TORINO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('DERTHONA NUOTO','DERTHONA NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'DERTHONA NUOTO'),'DERTHONA NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POLISP. PIAN DEL BR','POLISP. PIAN DEL BR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POLISP. PIAN DEL BR'),'POLISP. PIAN DEL BR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CONERO WELLNESS','CONERO WELLNESS','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CONERO WELLNESS'),'CONERO WELLNESS','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('PISCINE DI STRA E V','PISCINE DI STRA E V','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'PISCINE DI STRA E V'),'PISCINE DI STRA E V','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ADRIA NUOTO SSD  AR','ADRIA NUOTO SSD  AR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ADRIA NUOTO SSD  AR'),'ADRIA NUOTO SSD  AR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('MARCONI 93 APD','MARCONI 93 APD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'MARCONI 93 APD'),'MARCONI 93 APD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ASS.SPORTIVA DINAMI','ASS.SPORTIVA DINAMI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ASS.SPORTIVA DINAMI'),'ASS.SPORTIVA DINAMI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('OSIMO NUOTO','OSIMO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'OSIMO NUOTO'),'OSIMO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('MONTENUOTO S.S.D RL','MONTENUOTO S.S.D RL','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'MONTENUOTO S.S.D RL'),'MONTENUOTO S.S.D RL','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FANATIK TEAM FORLI','FANATIK TEAM FORLI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FANATIK TEAM FORLI'),'FANATIK TEAM FORLI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AQUATIC FORUM','AQUATIC FORUM','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AQUATIC FORUM'),'AQUATIC FORUM','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('SAVENA NUOTO TEAM A',11,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,11,'SAVENA NUOTO TEAM A','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FERRARANUOTO ASD','FERRARANUOTO ASD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FERRARANUOTO ASD'),'FERRARANUOTO ASD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CIVATURS DE AKKER','CIVATURS DE AKKER','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CIVATURS DE AKKER'),'CIVATURS DE AKKER','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RARI NANTES VENEZIA','RARI NANTES VENEZIA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RARI NANTES VENEZIA'),'RARI NANTES VENEZIA','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('NUOTO CLUB SASSUOLO',29,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,29,'NUOTO CLUB SASSUOLO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FLAMINIO SPORTING C','FLAMINIO SPORTING C','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FLAMINIO SPORTING C'),'FLAMINIO SPORTING C','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TIBIDABO SSD','TIBIDABO SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TIBIDABO SSD'),'TIBIDABO SSD','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('REGGIANA NUOTO',11,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,11,'REGGIANA NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TEAM INSUBRIKA ASD','TEAM INSUBRIKA ASD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TEAM INSUBRIKA ASD'),'TEAM INSUBRIKA ASD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AS ACQUAZZURRA ATR','AS ACQUAZZURRA ATR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AS ACQUAZZURRA ATR'),'AS ACQUAZZURRA ATR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SOC. 2001 SRL - PAD','SOC. 2001 SRL - PAD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SOC. 2001 SRL - PAD'),'SOC. 2001 SRL - PAD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ICE CLUB COMO','ICE CLUB COMO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ICE CLUB COMO'),'ICE CLUB COMO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('HIDRON SPORT SSD','HIDRON SPORT SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'HIDRON SPORT SSD'),'HIDRON SPORT SSD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('C.N. MONTECATINI','C.N. MONTECATINI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'C.N. MONTECATINI'),'C.N. MONTECATINI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AS L. NUOTO GIUNONE','AS L. NUOTO GIUNONE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AS L. NUOTO GIUNONE'),'AS L. NUOTO GIUNONE','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CSS VERONA','CSS VERONA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CSS VERONA'),'CSS VERONA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTATORI RAVENNATI','NUOTATORI RAVENNATI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTATORI RAVENNATI'),'NUOTATORI RAVENNATI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RIVIERA NUOTO VENET','RIVIERA NUOTO VENET','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RIVIERA NUOTO VENET'),'RIVIERA NUOTO VENET','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('VILLA BONELLI NUOTO','VILLA BONELLI NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'VILLA BONELLI NUOTO'),'VILLA BONELLI NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SEA SUB MODENA','SEA SUB MODENA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SEA SUB MODENA'),'SEA SUB MODENA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('D.L.F. LIVORNO','D.L.F. LIVORNO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'D.L.F. LIVORNO'),'D.L.F. LIVORNO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTATORI MILANESI','NUOTATORI MILANESI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTATORI MILANESI'),'NUOTATORI MILANESI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SIMPLY SPORT','SIMPLY SPORT','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SIMPLY SPORT'),'SIMPLY SPORT','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTO OTELLO PUTINA','NUOTO OTELLO PUTINA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTO OTELLO PUTINA'),'NUOTO OTELLO PUTINA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('C.U.S. BOLOGNA','C.U.S. BOLOGNA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'C.U.S. BOLOGNA'),'C.U.S. BOLOGNA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TEAM LOMBARDIA N MG','TEAM LOMBARDIA N MG','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TEAM LOMBARDIA N MG'),'TEAM LOMBARDIA N MG','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SAN VITO NUOTO','SAN VITO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SAN VITO NUOTO'),'SAN VITO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('VERSILIANUOTO',17,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,17,'VERSILIANUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('DELPHINIA S.BENEDET','DELPHINIA S.BENEDET','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'DELPHINIA S.BENEDET'),'DELPHINIA S.BENEDET','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ADRIAKOS NM SENIGAL','ADRIAKOS NM SENIGAL','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ADRIAKOS NM SENIGAL'),'ADRIAKOS NM SENIGAL','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('PETER PAN S.C.','PETER PAN S.C.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'PETER PAN S.C.'),'PETER PAN S.C.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ASD ALDEBARAN','ASD ALDEBARAN','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ASD ALDEBARAN'),'ASD ALDEBARAN','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTO CENTER FORLI`','NUOTO CENTER FORLI`','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTO CENTER FORLI`'),'NUOTO CENTER FORLI`','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('S.S. ROVIGO NUOTO','S.S. ROVIGO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'S.S. ROVIGO NUOTO'),'S.S. ROVIGO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CO.GE.SE. S.BENEDET','CO.GE.SE. S.BENEDET','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CO.GE.SE. S.BENEDET'),'CO.GE.SE. S.BENEDET','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FUTURA SOC. COOP.','FUTURA SOC. COOP.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FUTURA SOC. COOP.'),'FUTURA SOC. COOP.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POLISPORT SRL','POLISPORT SRL','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POLISPORT SRL'),'POLISPORT SRL','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTO PIOMBINO','NUOTO PIOMBINO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTO PIOMBINO'),'NUOTO PIOMBINO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CIRCOLO CAN NAPOLI','CIRCOLO CAN NAPOLI','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CIRCOLO CAN NAPOLI'),'CIRCOLO CAN NAPOLI','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('GYMNASIUM SPILIMBER','GYMNASIUM SPILIMBER','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'GYMNASIUM SPILIMBER'),'GYMNASIUM SPILIMBER','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('PRESIDENT BOLOGNA','PRESIDENT BOLOGNA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'PRESIDENT BOLOGNA'),'PRESIDENT BOLOGNA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ASS.NE AMICI DEL NU','ASS.NE AMICI DEL NU','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ASS.NE AMICI DEL NU'),'ASS.NE AMICI DEL NU','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('D.N. PONTEDERA','D.N. PONTEDERA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'D.N. PONTEDERA'),'D.N. PONTEDERA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RARI NANTES U.O.E.I','RARI NANTES U.O.E.I','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RARI NANTES U.O.E.I'),'RARI NANTES U.O.E.I','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RARI NANTES MOGLIAN','RARI NANTES MOGLIAN','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RARI NANTES MOGLIAN'),'RARI NANTES MOGLIAN','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SALZBURGER TURNVEREIN','SALZBURGER TURNVEREIN','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SALZBURGER TURNVEREIN'),'SALZBURGER TURNVEREIN','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SC TUSCOLANO','SC TUSCOLANO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SC TUSCOLANO'),'SC TUSCOLANO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('LA WELLNESS','LA WELLNESS','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'LA WELLNESS'),'LA WELLNESS','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('MARINA MILITARE CS','MARINA MILITARE CS','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'MARINA MILITARE CS'),'MARINA MILITARE CS','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('PADOVANUOTO S.R.L.','PADOVANUOTO S.R.L.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'PADOVANUOTO S.R.L.'),'PADOVANUOTO S.R.L.','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('NUOTO CLUB LUGO',29,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,29,'NUOTO CLUB LUGO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SISPORT FIAT S.P.A.','SISPORT FIAT S.P.A.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SISPORT FIAT S.P.A.'),'SISPORT FIAT S.P.A.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('REZZATO N','REZZATO N','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'REZZATO N'),'REZZATO N','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CANOTTIERI ARNO','CANOTTIERI ARNO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CANOTTIERI ARNO'),'CANOTTIERI ARNO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SAFA 2000 SSD SRL','SAFA 2000 SSD SRL','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SAFA 2000 SSD SRL'),'SAFA 2000 SSD SRL','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ACQUARIA SRL SSD','ACQUARIA SRL SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ACQUARIA SRL SSD'),'ACQUARIA SRL SSD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POLISPORTIVA NADIR','POLISPORTIVA NADIR','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POLISPORTIVA NADIR'),'POLISPORTIVA NADIR','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('FUTURA TIRANO','FUTURA TIRANO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'FUTURA TIRANO'),'FUTURA TIRANO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('S.S. LAZIO NUOTO','S.S. LAZIO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'S.S. LAZIO NUOTO'),'S.S. LAZIO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('NUOTO AICS BOLOGNA',29,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,29,'NUOTO AICS BOLOGNA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('IL DELFINO SPOLETO','IL DELFINO SPOLETO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'IL DELFINO SPOLETO'),'IL DELFINO SPOLETO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('KOMAROS SUB ANCONA','KOMAROS SUB ANCONA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'KOMAROS SUB ANCONA'),'KOMAROS SUB ANCONA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POL. SANGIULIANESE','POL. SANGIULIANESE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POL. SANGIULIANESE'),'POL. SANGIULIANESE','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('AS SOTTOSOPRA','AS SOTTOSOPRA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'AS SOTTOSOPRA'),'AS SOTTOSOPRA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('G.S. SAMB 87 A.S.D.','G.S. SAMB 87 A.S.D.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'G.S. SAMB 87 A.S.D.'),'G.S. SAMB 87 A.S.D.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ABANO NUOTO','ABANO NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ABANO NUOTO'),'ABANO NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('AZZURRA RACE TEAM',9,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,9,'AZZURRA RACE TEAM','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POOL N SAMBENEDETTE','POOL N SAMBENEDETTE','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POOL N SAMBENEDETTE'),'POOL N SAMBENEDETTE','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('DUE PONTI SRL','DUE PONTI SRL','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'DUE PONTI SRL'),'DUE PONTI SRL','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RN FRIULIA','RN FRIULIA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RN FRIULIA'),'RN FRIULIA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('BERGAMO SWIM TEAM','BERGAMO SWIM TEAM','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'BERGAMO SWIM TEAM'),'BERGAMO SWIM TEAM','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('POLISPORTIVA TMC','POLISPORTIVA TMC','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'POLISPORTIVA TMC'),'POLISPORTIVA TMC','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RANAZZURRA CONEGLIA','RANAZZURRA CONEGLIA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RANAZZURRA CONEGLIA'),'RANAZZURRA CONEGLIA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('SPORTIVA NUOTO GROS','SPORTIVA NUOTO GROS','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'SPORTIVA NUOTO GROS'),'SPORTIVA NUOTO GROS','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('TRICOLORE MASTER AS','TRICOLORE MASTER AS','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'TRICOLORE MASTER AS'),'TRICOLORE MASTER AS','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('ACQUAMBIENTE SSD -',6,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,6,'ACQUAMBIENTE SSD -','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('PROGETTO ACQUA PESC','PROGETTO ACQUA PESC','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'PROGETTO ACQUA PESC'),'PROGETTO ACQUA PESC','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('ASD CLUB L`AQUILA N','ASD CLUB L`AQUILA N','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'ASD CLUB L`AQUILA N'),'ASD CLUB L`AQUILA N','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CIRCOLO NUOTO LUCCA','CIRCOLO NUOTO LUCCA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CIRCOLO NUOTO LUCCA'),'CIRCOLO NUOTO LUCCA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('S.S.V. BOZEN','S.S.V. BOZEN','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'S.S.V. BOZEN'),'S.S.V. BOZEN','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CILO SRL SSD','CILO SRL SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CILO SRL SSD'),'CILO SRL SSD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('BONDENO NUOTO ASD','BONDENO NUOTO ASD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'BONDENO NUOTO ASD'),'BONDENO NUOTO ASD','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CAN BALDESIO','CAN BALDESIO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CAN BALDESIO'),'CAN BALDESIO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CAN VITTORINO','CAN VITTORINO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CAN VITTORINO'),'CAN VITTORINO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('RAPALLO N.','RAPALLO N.','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'RAPALLO N.'),'RAPALLO N.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('QUANTA SPORT VILLAG','QUANTA SPORT VILLAG','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'QUANTA SPORT VILLAG'),'QUANTA SPORT VILLAG','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('MARCHE NUOTO','MARCHE NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'MARCHE NUOTO'),'MARCHE NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES
    ('SENIGALLIA NUOTO A.',11,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,11,'SENIGALLIA NUOTO A.','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('NUOTO MONTEFELTRO','NUOTO MONTEFELTRO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'NUOTO MONTEFELTRO'),'NUOTO MONTEFELTRO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('A.S.D. GREVE NUOTO','A.S.D. GREVE NUOTO','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'A.S.D. GREVE NUOTO'),'A.S.D. GREVE NUOTO','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('C.S. TEAM PADOVA','C.S. TEAM PADOVA','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'C.S. TEAM PADOVA'),'C.S. TEAM PADOVA','',0,1,CURDATE(),CURDATE());

INSERT INTO teams (name,editable_name,address,e_mail,contact_name,user_id,created_at,updated_at) VALUES
    ('CONSELVE NUOTO SSD','CONSELVE NUOTO SSD','','','',1,CURDATE(),CURDATE());
INSERT INTO team_affiliations (season_id,team_id,name,number,must_calculate_goggle_cup,user_id,created_at,updated_at) VALUES
    (112,(select t.id from teams t where t.name = 'CONSELVE NUOTO SSD'),'CONSELVE NUOTO SSD','',0,1,CURDATE(),CURDATE());

COMMIT;
