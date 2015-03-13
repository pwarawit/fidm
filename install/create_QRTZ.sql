-- This script is a hack, work around to issue of QuartzSystemListener.ERROR_0007_SEQERROR
-- It is basically create a fake table "QRTZ" to fool the script that start listener in quartz database

--Begin Connect--
\connect quartz pentaho_user

begin;

drop table if exists QRTZ;

CREATE TABLE "QRTZ"
  (
    NAME  VARCHAR(200) NOT NULL,
    PRIMARY KEY (NAME)
);

ALTER TABLE QRTZ OWNER TO pentaho_user;

commit;
--End Connect--

-- Remark : Check in phpPgAdmin if the table name is QRZT (all caps), if not we need to create it manually in phpPgAdmin