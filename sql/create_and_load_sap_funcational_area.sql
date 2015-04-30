--Begin Connect--
\connect fidm fidm

-- This script create and load table sap_functional_area 

DROP TABLE IF EXISTS sap_functional_area;

CREATE TABLE sap_functional_area(code VARCHAR(3) NOT NULL, name VARCHAR(50) NOT NULL, PRIMARY KEY (code));

insert into sap_functional_area(code,name) values('000','Fixed Cost (Central Opera');
insert into sap_functional_area(code,name) values('001','Staff Cost (Staff of RECO');
insert into sap_functional_area(code,name) values('002','Operating Cost (RECOFTC) ');
insert into sap_functional_area(code,name) values('003','Capital Cost (RECOFTC)   ');
insert into sap_functional_area(code,name) values('100','Atv. - Consultant/Resourc');
insert into sap_functional_area(code,name) values('101','Atv. - Participant       ');
insert into sap_functional_area(code,name) values('102','Atv. - Assistant Program ');
insert into sap_functional_area(code,name) values('103','Atv. - Staff             ');
insert into sap_functional_area(code,name) values('104','Atv. - Operating Cost of ');
insert into sap_functional_area(code,name) values('105','Atv. - Capital Cost of th');
insert into sap_functional_area(code,name) values('106','Atv. - Others            ');

