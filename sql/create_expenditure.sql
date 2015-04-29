--Begin Connect--
\connect fidm fidm

-- This script take 2 parameters : Fiscal Year and month - both in integer
-- v_fiscal_year, v_posting_period

DROP TABLE IF EXISTS tmp_mth_raw_exp;
DROP TABLE IF EXISTS tmp_ytd_raw_exp;

-- This command create a table that contains the month EXP data 
create table tmp_mth_raw_exp as
select
	a.*
	,b.line_item             
	,b.posting_key           
	,b.account_type          
	,b.debitcredit_ind       
	,b.amount_local_currency 
	,b.amount_doc_currency      
	,b.gl_amount             
	,b.doc_currency          
	,b.gl_currency           
	,b.item_text             
	,b.cost_center           
	,b.order_number          
	,b.gl_account            
	,b.bs_account_flag       
	,b.pl_account_type       
	,b.functional_area       
	,b.cost_element          
	,b.donor                 
	,b.activity_code         
	,b.donor_line            
	,b.benefit_country       
	,b.theme                 
	,b.outcome               
	,b.gender_rights         
	,b.cf_leader             
	,b.monitor_eval          
	,b.staff_no              
from sap_bkpf a, sap_bseg b
where a.document_number=b.document_number
and a.fiscal_year=b.fiscal_year
and a.posting_period=:v_posting_period
and a.fiscal_year=:v_fiscal_year
;

create table tmp_ytd_raw_exp as
select
	a.*
	,b.line_item             
	,b.posting_key           
	,b.account_type          
	,b.debitcredit_ind       
	,b.amount_local_currency 
	,b.amount_doc_currency      
	,b.gl_amount             
	,b.doc_currency          
	,b.gl_currency           
	,b.item_text             
	,b.cost_center           
	,b.order_number          
	,b.gl_account            
	,b.bs_account_flag       
	,b.pl_account_type       
	,b.functional_area       
	,b.cost_element          
	,b.donor                 
	,b.activity_code         
	,b.donor_line            
	,b.benefit_country       
	,b.theme                 
	,b.outcome               
	,b.gender_rights         
	,b.cf_leader             
	,b.monitor_eval          
	,b.staff_no              
from sap_bkpf a, sap_bseg b
where a.document_number=b.document_number
and a.fiscal_year=b.fiscal_year
and a.fiscal_year=:v_fiscal_year
and a.posting_period between 1 and :v_posting_period
;
