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
