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

DROP TABLE IF EXISTS theme;

CREATE TABLE theme
  (
    code    VARCHAR(30) NOT NULL,
    name    VARCHAR(250) NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO theme(code, name) VALUES('0','General');
INSERT INTO theme(code, name) VALUES('A','Securing Community Forestry');
INSERT INTO theme(code, name) VALUES('B','Enhancing Livelihoods and Markets');
INSERT INTO theme(code, name) VALUES('C','People, Forests, and Climate Change');
INSERT INTO theme(code, name) VALUES('D','Transforming Forest Conflicts');
INSERT INTO theme(code, name) VALUES('E','All');

ALTER TABLE theme OWNER TO fidm;

commit;
--End Connect--
