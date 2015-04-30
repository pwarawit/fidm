--Begin Connect--
\connect fidm fidm

-- This script take 2 parameters : Fiscal Year and month - both in integer
-- v_fiscal_year, v_posting_period

DROP TABLE IF EXISTS tmp_mth_raw_exp;
DROP TABLE IF EXISTS tmp_ytd_raw_exp;
DROP TABLE IF EXISTS tmp_sum_exp;

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

create table tmp_sum_exp as (
select
	fiscal_year
	,posting_period
	, extract(year from to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months') calendar_year
	, extract(month from to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months') calendar_month
	, to_char(to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months', 'MON-YYYY') calendar_year_month
	, local_currency
	, cost_center
	, cost_element
	, gl_account
	, order_number
	, functional_area
	, donor          
	, activity_code  
	, donor_line     
	, benefit_country
	, theme          
	, outcome        
	, gender_rights  
	, cf_leader      
	, monitor_eval   
	, staff_no       
	, sum(amount_local_currency) mth_amount_lc
	, sum(amount_doc_currency) mth_amount_tc
	, sum(gl_amount) mth_amount_gl
	, 0 ytd_amount_lc
	, 0 ytd_amount_tc
	, 0 ytd_amount_gl
from tmp_mth_raw_exp
where fiscal_year = :v_fiscal_year
group by 
	fiscal_year
	, posting_period
	, local_currency
	, cost_center
	, cost_element
	, gl_account
	, order_number
	, functional_area
	, donor          
	, activity_code  
	, donor_line     
	, benefit_country
	, theme          
	, outcome        
	, gender_rights  
	, cf_leader      
	, monitor_eval   
	, staff_no       
order by posting_period
)
;
	
	
insert into tmp_sum_exp (
select
	fiscal_year
	,:v_posting_period posting_period
	, extract(year from to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(:v_posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months') calendar_year
	, extract(month from to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(:v_posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months') calendar_month
	, to_char(to_date(to_char(fiscal_year,'0000')||'-'||trim(to_char(:v_posting_period,'00'))||'-01','yyyy-mm-dd') - interval '3 months', 'MON-YYYY') calendar_year_month
	, local_currency
	, cost_center
	, cost_element
	, gl_account
	, order_number
	, functional_area
	, donor          
	, activity_code  
	, donor_line     
	, benefit_country
	, theme          
	, outcome        
	, gender_rights  
	, cf_leader      
	, monitor_eval   
	, staff_no       
	, 0 mth_amount_lc
	, 0 mth_amount_tc
	, 0 mth_amount_gl
	, sum(amount_local_currency) ytd_amount_lc
	, sum(amount_doc_currency) ytd_amount_tc
	, sum(gl_amount) ytd_amount_gl
from tmp_ytd_raw_exp
where fiscal_year = :v_fiscal_year
group by 
	fiscal_year
	, local_currency
	, cost_center
	, cost_element
	, gl_account
	, order_number
	, functional_area
	, donor          
	, activity_code  
	, donor_line     
	, benefit_country
	, theme          
	, outcome        
	, gender_rights  
	, cf_leader      
	, monitor_eval   
	, staff_no       
order by posting_period
);
	