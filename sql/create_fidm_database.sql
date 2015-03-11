--Begin--
-- note: this script assumes pg_hba.conf is configured correctly
--

-- \connect postgres postgres

drop database if exists fidm;

CREATE DATABASE fidm  WITH OWNER = fidm  ENCODING = 'UTF8' TABLESPACE = pg_default;

GRANT ALL ON DATABASE fidm to fidm;

--End--
--Begin Connect--
\connect fidm fidm

begin;

DROP TABLE IF EXISTS donor_group;
DROP TABLE IF EXISTS theme;
DROP TABLE IF EXISTS outcome;
DROP TABLE IF EXISTS functional_area;
DROP TABLE IF EXISTS benefit_country;
DROP TABLE IF EXISTS donor;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS donor_line;

CREATE TABLE donor_group(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE theme(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE outcome(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE functional_area(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE benefit_country(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE donor(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE staff(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE activity(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));
CREATE TABLE donor_line(code VARCHAR(30) NOT NULL, name VARCHAR(250) NOT NULL, PRIMARY KEY (code));

----
INSERT INTO donor_group(code,name) VALUES('PRJ','Project Fund');
INSERT INTO donor_group(code,name) VALUES('RCF','RECOFTC Fund');
INSERT INTO donor_group(code,name) VALUES('RTG','Programme & RTG');
----
INSERT INTO theme(code, name) VALUES('0','General');
INSERT INTO theme(code, name) VALUES('A','Securing Community Forestry');
INSERT INTO theme(code, name) VALUES('B','Enhancing Livelihoods and Markets');
INSERT INTO theme(code, name) VALUES('C','People, Forests, and Climate Change');
INSERT INTO theme(code, name) VALUES('D','Transforming Forest Conflicts');
INSERT INTO theme(code, name) VALUES('E','All');
----
INSERT INTO outcome(code,name) VALUES('0','General');
INSERT INTO outcome(code,name) VALUES('1','Enhanced Capacities Used');
INSERT INTO outcome(code,name) VALUES('2','Enabling Policies Adopted');
INSERT INTO outcome(code,name) VALUES('3','Communition Products Used');
INSERT INTO outcome(code,name) VALUES('4','Improved Practices Adopted');
INSERT INTO outcome(code,name) VALUES('5','All');
----
INSERT INTO functional_area(code,name) VALUES('000','Fixed Cost (Central Opera');
INSERT INTO functional_area(code,name) VALUES('001','Staff Cost (Staff of RECO');
INSERT INTO functional_area(code,name) VALUES('002','Operating Cost (RECOFTC)');
INSERT INTO functional_area(code,name) VALUES('003','Capital Cost (RECOFTC)');
INSERT INTO functional_area(code,name) VALUES('100','Atv. - Consultant/Resourc');
INSERT INTO functional_area(code,name) VALUES('101','Atv. - Participant');
INSERT INTO functional_area(code,name) VALUES('102','Atv. - Assistant Program');
INSERT INTO functional_area(code,name) VALUES('103','Atv. - Staff');
INSERT INTO functional_area(code,name) VALUES('104','Atv. - Operating Cost of');
INSERT INTO functional_area(code,name) VALUES('105','Atv. - Capital Cost of th');
INSERT INTO functional_area(code,name) VALUES('106','Atv. - Others');
----
INSERT INTO benefit_country(code,name) VALUES('0000','Regional');
INSERT INTO benefit_country(code,name) VALUES('1111','Bangkok');
INSERT INTO benefit_country(code,name) VALUES('2222','Global');
INSERT INTO benefit_country(code,name) VALUES('BHUT','BHUTAN');
INSERT INTO benefit_country(code,name) VALUES('CAMB','CAMBODIA');
INSERT INTO benefit_country(code,name) VALUES('CHIN','CHINA');
INSERT INTO benefit_country(code,name) VALUES('INDI','INDIA');
INSERT INTO benefit_country(code,name) VALUES('INDO','INDONESIA');
INSERT INTO benefit_country(code,name) VALUES('JPAN','JAPAN');
INSERT INTO benefit_country(code,name) VALUES('LAOS','LAOS');
INSERT INTO benefit_country(code,name) VALUES('MALY','MALAYSIA');
INSERT INTO benefit_country(code,name) VALUES('MEXI','MEXICO');
INSERT INTO benefit_country(code,name) VALUES('MMAR','MYANMAR');
INSERT INTO benefit_country(code,name) VALUES('MONG','MONGOLIA');
INSERT INTO benefit_country(code,name) VALUES('NEPL','NEPAL');
INSERT INTO benefit_country(code,name) VALUES('PHIL','PHILIPPINES');
INSERT INTO benefit_country(code,name) VALUES('PPNG','PAPUA NEW GUINEA');
INSERT INTO benefit_country(code,name) VALUES('SAMO','SAMOA');
INSERT INTO benefit_country(code,name) VALUES('SOLO','SOLOMON ISLANDS');
INSERT INTO benefit_country(code,name) VALUES('SRIL','SRILANKA');
INSERT INTO benefit_country(code,name) VALUES('TANZ','TANZANIA');
INSERT INTO benefit_country(code,name) VALUES('THAI','THAILAND');
INSERT INTO benefit_country(code,name) VALUES('TIML','TIMOR LESTE');
INSERT INTO benefit_country(code,name) VALUES('VIET','VIETNAM');
----
INSERT INTO donor(code,name) VALUES("ADA","USAID Adapt Asia-Pacific");
----
INSERT INTO staff(code,name) VALUES('00001','Apinita Siripatt');
INSERT INTO staff(code,name) VALUES('00002','Ann Jyothis Raj (Resign)');
INSERT INTO staff(code,name) VALUES('00003','Anocha Chuenwanta');
INSERT INTO staff(code,name) VALUES('00004','Ahmad Dhiaulhaq (Resign)');
INSERT INTO staff(code,name) VALUES('00005','Atcharaporn Daisai');
INSERT INTO staff(code,name) VALUES('00006','Alyssa Cheung');
INSERT INTO staff(code,name) VALUES('00007','Boonruen Mateang');
INSERT INTO staff(code,name) VALUES('00008','Bernhard Mohns');
INSERT INTO staff(code,name) VALUES('00009','Bhawana Upadhyay (Resign)');
INSERT INTO staff(code,name) VALUES('00010','Benjaporn Mongkonsri');
INSERT INTO staff(code,name) VALUES('00011','Bishnu Hari Paudyal');
INSERT INTO staff(code,name) VALUES('00012','Bun Narin');
INSERT INTO staff(code,name) VALUES('00013','Natthika Changprasert');
INSERT INTO staff(code,name) VALUES('00014','Chongon Tantavanich');
INSERT INTO staff(code,name) VALUES('00015','Caroline Liou');
INSERT INTO staff(code,name) VALUES('00016','Chawpaka Chaosarn');
INSERT INTO staff(code,name) VALUES('00017','Chea Chan Neuv');
INSERT INTO staff(code,name) VALUES('00018','Chheng Channy');
INSERT INTO staff(code,name) VALUES('00019','Chy bobta');
INSERT INTO staff(code,name) VALUES('00020','David Gritten');
INSERT INTO staff(code,name) VALUES('00022','Emily Etue');
INSERT INTO staff(code,name) VALUES('00023','Etienne Delattre');
INSERT INTO staff(code,name) VALUES('00024','Edwin Payuan (Resign)');
INSERT INTO staff(code,name) VALUES('00025','Elsa Dominish (Resign)');
INSERT INTO staff(code,name) VALUES('00026','Panisara Panupitak');
INSERT INTO staff(code,name) VALUES('00027','Fabian Noeske');
INSERT INTO staff(code,name) VALUES('00029','Heng Da');
INSERT INTO staff(code,name) VALUES('00030','Hou Kalyan');
INSERT INTO staff(code,name) VALUES('00031','Im Maredi');
INSERT INTO staff(code,name) VALUES('00032','Im Sophanna');
INSERT INTO staff(code,name) VALUES('00033','Jaras Buakartok');
INSERT INTO staff(code,name) VALUES('00034','Pashakorn Supriyasilp');
INSERT INTO staff(code,name) VALUES('00035','James Bampton');
INSERT INTO staff(code,name) VALUES('00037','Julian Atkinson');
INSERT INTO staff(code,name) VALUES('00038','Jephraim Oro');
INSERT INTO staff(code,name) VALUES('00039','Jaako Salakka (Resign)');
INSERT INTO staff(code,name) VALUES('00040','Komkris Jarutrakulchai');
INSERT INTO staff(code,name) VALUES('00041','Kasma Chatiyanont');
INSERT INTO staff(code,name) VALUES('00043','Kanchana Wiset');
INSERT INTO staff(code,name) VALUES('00045','Kanti Panjatanasak');
INSERT INTO staff(code,name) VALUES('00046','Komchai Thaiying');
INSERT INTO staff(code,name) VALUES('00047','Khamkeo Vongsavanh');
INSERT INTO staff(code,name) VALUES('00048','Kao Vutha');
INSERT INTO staff(code,name) VALUES('00049','Keat Pengkun');
INSERT INTO staff(code,name) VALUES('00050','Khin Moe Gyi');
INSERT INTO staff(code,name) VALUES('00051','Khorn Sophoeun');
INSERT INTO staff(code,name) VALUES('00052','Kirivuth Chhneang');
INSERT INTO staff(code,name) VALUES('00053','Koeu Lanet');
INSERT INTO staff(code,name) VALUES('00054','Kourk Thoeun');
INSERT INTO staff(code,name) VALUES('00055','Khankeo Outhasak');
INSERT INTO staff(code,name) VALUES('00056','Leela Wuttikraibundit');
INSERT INTO staff(code,name) VALUES('00057','Lissa');
INSERT INTO staff(code,name) VALUES('00058','Luong Quang Hung');
INSERT INTO staff(code,name) VALUES('00059','Ly Kea');
INSERT INTO staff(code,name) VALUES('00061','Martin Greijmans');
INSERT INTO staff(code,name) VALUES('00062','Ma Seavchhe');
INSERT INTO staff(code,name) VALUES('00063','Mac Thi Thanh Tuyen');
INSERT INTO staff(code,name) VALUES('00064','Maung Maung Than');
INSERT INTO staff(code,name) VALUES('00065','Men Vannak');
INSERT INTO staff(code,name) VALUES('00066','Maria Alberto (Maridel) (Resign)');
INSERT INTO staff(code,name) VALUES('00067','Nguyen Quang Tan');
INSERT INTO staff(code,name) VALUES('00068','Zaw Win (Resign)');
INSERT INTO staff(code,name) VALUES('00069','Nguyen Thi Mai Phuong');
INSERT INTO staff(code,name) VALUES('00070','Nguyen Thi Phuong Dung');
INSERT INTO staff(code,name) VALUES('00071','Nicholas Wilder (Resign)');
INSERT INTO staff(code,name) VALUES('00072','Ouch Laksmey');
INSERT INTO staff(code,name) VALUES('00073','Thanyarat Athichotthanyanon');
INSERT INTO staff(code,name) VALUES('00074','Payung Tongkum');
INSERT INTO staff(code,name) VALUES('00075','Phenpichar Sakhamula');
INSERT INTO staff(code,name) VALUES('00076','Prapai Srikram');
INSERT INTO staff(code,name) VALUES('00077','Pimpakarn Serithammarak');
INSERT INTO staff(code,name) VALUES('00078','Pal Bunnarak');
INSERT INTO staff(code,name) VALUES('00079','Wirinya Chatwiriyamongkol');
INSERT INTO staff(code,name) VALUES('00080','Pantharee Kuruchitkosol');
INSERT INTO staff(code,name) VALUES('00081','Pratya Youngpatana');
INSERT INTO staff(code,name) VALUES('00082','Peak Monau');
INSERT INTO staff(code,name) VALUES('00083','Phinyada Atchatavivan');
INSERT INTO staff(code,name) VALUES('00084','Phudis Phiphitkun (Resign)');
INSERT INTO staff(code,name) VALUES('00085','Phung Thanh Xuan');
INSERT INTO staff(code,name) VALUES('00087','Ronnakorn Triraganon');
INSERT INTO staff(code,name) VALUES('00088','Ramida Thanananthachat (Resign)');
INSERT INTO staff(code,name) VALUES('00089','Regan Suzuki');
INSERT INTO staff(code,name) VALUES('00090','Ratkawee Boonmake');
INSERT INTO staff(code,name) VALUES('00092','Reymondo Caraan');
INSERT INTO staff(code,name) VALUES('00093','Ratchada Arpornsilp');
INSERT INTO staff(code,name) VALUES('00094','Rawee Thaworn');
INSERT INTO staff(code,name) VALUES('00095','Rejani Kunjappan');
INSERT INTO staff(code,name) VALUES('00096','Saifon Bhumpakpan');
INSERT INTO staff(code,name) VALUES('00097','Sa-nguan Jongjit');
INSERT INTO staff(code,name) VALUES('00100','Supaporn Panwaree');
INSERT INTO staff(code,name) VALUES('00102','Somying Soontornwong (Resign)');
INSERT INTO staff(code,name) VALUES('00103','Sorn Chansey');
INSERT INTO staff(code,name) VALUES('00104','Chandra Silori');
INSERT INTO staff(code,name) VALUES('00105','Stefan Bepler (Resign)');
INSERT INTO staff(code,name) VALUES('00109','Shyam Paudel (Resign)');
INSERT INTO staff(code,name) VALUES('00110','Sirichai Saengcharnchai');
INSERT INTO staff(code,name) VALUES('00111','Sao Moeun');
INSERT INTO staff(code,name) VALUES('00112','Sarunyu Teantep');
INSERT INTO staff(code,name) VALUES('00113','Sat Sovanna');
INSERT INTO staff(code,name) VALUES('00114','Sim Kong (Resign)');
INSERT INTO staff(code,name) VALUES('00115','Simone Bianchi (Resign)');
INSERT INTO staff(code,name) VALUES('00116','Somaya Bunchorntavakul');
INSERT INTO staff(code,name) VALUES('00117','Sophie Lewis (Resign)');
INSERT INTO staff(code,name) VALUES('00118','Su Pan Aung');
INSERT INTO staff(code,name) VALUES('00119','Subantita Suwan');
INSERT INTO staff(code,name) VALUES('00120','Suphannee Charatmanachot');
INSERT INTO staff(code,name) VALUES('00121','Sureeporn Klaypan');
INSERT INTO staff(code,name) VALUES('00124','Thippawan Maidee');
INSERT INTO staff(code,name) VALUES('00125','Toon De Bruyn');
INSERT INTO staff(code,name) VALUES('00126','Tint Lwin Thaung');
INSERT INTO staff(code,name) VALUES('00128','Tomi Haryadi');
INSERT INTO staff(code,name) VALUES('00129','Tiamkare Thitithamtada');
INSERT INTO staff(code,name) VALUES('00131','Veth Sonim');
INSERT INTO staff(code,name) VALUES('00132','Vin Bunna');
INSERT INTO staff(code,name) VALUES('00133','Vu Huu Than');
INSERT INTO staff(code,name) VALUES('00134','Vy Phalluy');
INSERT INTO staff(code,name) VALUES('00135','Vinai Im-aim');
INSERT INTO staff(code,name) VALUES('00136','Wacharee Kanyamasa');
INSERT INTO staff(code,name) VALUES('00137','Warangkana Rattanarat');
INSERT INTO staff(code,name) VALUES('00138','Wilai Morsuwan');
INSERT INTO staff(code,name) VALUES('00139','Wisanlaya Boonsueb');
INSERT INTO staff(code,name) VALUES('00141','Yosef Arihadi');
INSERT INTO staff(code,name) VALUES('00142','Yuyun Yuningsih');
INSERT INTO staff(code,name) VALUES('00143','Yuki Nakamura (Resign)');
INSERT INTO staff(code,name) VALUES('00144','Frederick Natividad');
INSERT INTO staff(code,name) VALUES('00145','Paweenrat Phichitbovornsak (Resign)');
INSERT INTO staff(code,name) VALUES('00146','Suthisak Langthong (Resign)');
INSERT INTO staff(code,name) VALUES('00147','Tann Senghoin');
INSERT INTO staff(code,name) VALUES('00148','Tep Chansothea (Resign)');
INSERT INTO staff(code,name) VALUES('00149','Thach Metrey');
INSERT INTO staff(code,name) VALUES('00150','Thongsavath Boupha');
INSERT INTO staff(code,name) VALUES('00151','Thou Khoeur');
INSERT INTO staff(code,name) VALUES('00152','Tol Sokchea');
INSERT INTO staff(code,name) VALUES('00153','Ty Puthiera');
INSERT INTO staff(code,name) VALUES('00154','Thi Bui Linh');
INSERT INTO staff(code,name) VALUES('00156','Kemly Ouch');
INSERT INTO staff(code,name) VALUES('00157','Evan Gershkovich');
INSERT INTO staff(code,name) VALUES('00158','Aung Kyaw Naing');
INSERT INTO staff(code,name) VALUES('00159','Seth Kane');
INSERT INTO staff(code,name) VALUES('00160','Christian Rivera');
INSERT INTO staff(code,name) VALUES('00161','Hoev Kimsreng');
INSERT INTO staff(code,name) VALUES('00162','Mey Thearith');
INSERT INTO staff(code,name) VALUES('00163','Ma Sophal');
INSERT INTO staff(code,name) VALUES('00164','Kry Borey');
INSERT INTO staff(code,name) VALUES('00165','Hong Chhay');
INSERT INTO staff(code,name) VALUES('00166','Rin Naroeun');
INSERT INTO staff(code,name) VALUES('00167','Kinnalone Phommasack (Resign)');
INSERT INTO staff(code,name) VALUES('00168','Tatcha Sutthidechsoontorn');
INSERT INTO staff(code,name) VALUES('00169','Proeung Som On');
INSERT INTO staff(code,name) VALUES('00170','Rith Bo');
INSERT INTO staff(code,name) VALUES('00171','Keo Darith');
INSERT INTO staff(code,name) VALUES('00172','Long Hay (Resign)');
INSERT INTO staff(code,name) VALUES('00173','Phonexay Khammavong');
INSERT INTO staff(code,name) VALUES('00174','Bounyadeth Phouangmala');
INSERT INTO staff(code,name) VALUES('00175','Nuttasak Patcharasomboon');
INSERT INTO staff(code,name) VALUES('00176','Punchayanut Srisuwattanasakul');
INSERT INTO staff(code,name) VALUES('00177','Chhay Senkhammoungkhoun');
INSERT INTO staff(code,name) VALUES('00178','Februanty Suyatiningsih');
INSERT INTO staff(code,name) VALUES('00179','Sa Tin Min Aung');
INSERT INTO staff(code,name) VALUES('00180','Melanie Feurer');
INSERT INTO staff(code,name) VALUES('00181','Detty Saluling');
INSERT INTO staff(code,name) VALUES('00182','Han Swe Oo');
INSERT INTO staff(code,name) VALUES('00183','Kyaw Nyut');
INSERT INTO staff(code,name) VALUES('00184','Myint Zaw');
INSERT INTO staff(code,name) VALUES('00185','Than Swe');
INSERT INTO staff(code,name) VALUES('00186','Thien Saung');
INSERT INTO staff(code,name) VALUES('00187','Binod Chapagain');
INSERT INTO staff(code,name) VALUES('99999','Dummy Staff');
----
----
----
ALTER TABLE donor_group OWNER TO fidm;
ALTER TABLE theme OWNER TO fidm;
ALTER TABLE outcome OWNER TO fidm;
ALTER TABLE functional_area OWNER TO fidm;
ALTER TABLE benefit_country OWNER TO fidm;
ALTER TABLE donor OWNER TO fidm;
ALTER TABLE staff OWNER TO fidm;
ALTER TABLE activity OWNER TO fidm;
ALTER TABLE donor_line OWNER TO fidm;

commit;
--End Connect--
