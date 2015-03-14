--Begin Connect--
\connect fidm fidm

begin;

DROP TABLE IF EXISTS tmp_gl_line;

CREATE TABLE tmp_gl_line(
    symbol VARCHAR(2), 
    assignment VARCHAR(18),
    document_number VARCHAR(10),
    business_area   VARCHAR(4),
    document_type   VARCHAR(3),
    document_date   VARCHAR(10),
    posting_key     VARCHAR(2),
    amount_in_local_currency    VARCHAR(20),
    local_currency  VARCHAR(5),
    tax_code        VARCHAR(2),
    clearing_document   VARCHAR(10),
    profit_center   VARCHAR(10),
    segment    VARCHAR(10),
    text       VARCHAR(50),
    document_header_text VARCHAR(25),
    entry_date VARCHAR(10),
    parked_by  VARCHAR(12),
    user_name  VARCHAR(12),
    activity_code VARCHAR(10),
    benefit_county VARCHAR(4),
    cf_leadership  VARCHAR(1),
    donor          VARCHAR(5),
    donor_line     VARCHAR(10),
    gender_rights  VARCHAR(1),
    monitor_evaluate VARCHAR(1),
    outcome          VARCHAR(1),
    staff            VARCHAR(9),
    theme            VARCHAR(1)
);

ALTER TABLE tmp_gl_line OWNER TO fidm;

commit;
--End Connect--
