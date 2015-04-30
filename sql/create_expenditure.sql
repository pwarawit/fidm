--Begin Connect--
\connect fidm fidm

-- This script take 2 parameters : Fiscal Year and month - both in integer
-- v_fiscal_year, v_posting_period

DROP TABLE IF EXISTS tmp_mth_raw_exp;
DROP TABLE IF EXISTS tmp_ytd_raw_exp;
DROP TABLE IF EXISTS tmp_sum_exp;
DROP TABLE IF EXISTS expenditure;

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
	, 0.0 ytd_amount_lc
	, 0.0 ytd_amount_tc
	, 0.0 ytd_amount_gl
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
	, 0.0 mth_amount_lc
	, 0.0 mth_amount_tc
	, 0.0 mth_amount_gl
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

-- last step - creating table expenditure
create table expenditure as 
select
	a.fiscal_year        
	,a.posting_period     
	,a.calendar_year      
	,a.calendar_month     
	,a.calendar_year_month
	,a.local_currency     
	,a.cost_center        
	,coalesce(b.department,'Department:NULL') cost_center_name
	,a.cost_element
	,coalesce(c.name,'Cost Element:NULL') cost_element_name
	,a.gl_account         
	,coalesce(d.description, 'GL Account:NULL') gl_account_name
	,a.order_number
	,coalesce(e.description, 'Order Name:NULL') order_name
	,a.functional_area
	,coalesce(f.name, 'Funcation Area:NULL') functional_area_name
	,a.donor
	,coalesce(g.donor_name, 'Donor: NULL') donor_name
	,a.activity_code      
	,coalesce(h.activity_name, 'Activity: NULL') activity_name
	,a.donor_line         
	,coalesce(i.donor_line_name, 'Donor Line: NULL') donor_line_name
	,a.benefit_country    
	,coalesce(j.benefit_country_name, 'Benefit Country: NULL') benefit_country_name
	,a.theme              
	,coalesce(k.theme_name, 'Theme: NULL') theme_name
	,a.outcome
	,coalesce(l.outcome_name, 'Outcome: NULL') outcome_name
	,a.gender_rights      
	,a.cf_leader          
	,a.monitor_eval       
	,a.staff_no           
	,sum(a.mth_amount_lc) amount_lc_mth
	,sum(a.mth_amount_tc) amount_tc_mth
	,sum(a.mth_amount_gl) amount_gl_mth
	,sum(a.ytd_amount_lc) amount_lc_ytd
	,sum(a.ytd_amount_tc) amount_tc_ytd
	,sum(a.ytd_amount_gl) amount_gl_ytd
from 
	tmp_sum_exp a 
		left outer join sap_csks b on (a.cost_center = b.cost_center)
		left outer join sap_csku c on (a.cost_element = c.cost_element)
		left outer join sap_skat d on (a.gl_account = d.gl_account)
		left outer join sap_aufk e on (a.order_number = e.order_number)
		left outer join sap_functional_area f on (a.functional_area = f.code)
		left outer join sap_zdonor g on (a.donor = g.donor)
		left outer join sap_zactivity h on (a.activity_code = h.activity_code)
		left outer join sap_zdonor_line i on (a.donor_line = i.donor_line)
		left outer join sap_zbenefit_country j on (a.benefit_country = j.benefit_country)
		left outer join sap_ztheme k on (a.theme = k.theme)
		left outer join sap_zoutcome l on (a.outcome = l.outcome)
group by 
	 a.fiscal_year        
	,a.posting_period     
	,a.calendar_year      
	,a.calendar_month     
	,a.calendar_year_month
	,a.local_currency     
	,a.cost_center
	,b.department
	,a.cost_element
	,c.name
	,a.gl_account         
	,d.description
	,a.order_number
	,e.description
	,a.functional_area 
	,f.name
	,a.donor         
	,g.donor_name
	,a.activity_code      
	,h.activity_name
	,a.donor_line         
	,i.donor_line_name
	,a.benefit_country
	,j.benefit_country_name    
	,a.theme        
	,k.theme_name
	,a.outcome
	,l.outcome_name
	,a.gender_rights      
	,a.cf_leader          
	,a.monitor_eval       
	,a.staff_no           
;
	