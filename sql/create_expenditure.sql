--Begin Connect--
\connect fidm fidm

-- This script take 2 parameters : Fiscal Year and month - both in integer
-- v_fiscal_year, v_month


select count(*) from sap_bseg where fiscal_year = :v_fiscal_year;

