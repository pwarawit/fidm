select 
time_period, currency_name, month_year_name, cost_center_name,
activity_code, activity_name_long,
sum(prf_expense_mth) as prf_exp
, sum(rtg_expense_mth) as rtg_exp
, sum(rcf_expense_mth) as rcf_exp
, sum(prj_expense_mth) as prj_exp
, sum(total_expense_ytd) as total_exp
, sum(total_income_ytd) as total_inc
from dt_awp
--where 
--month_year_name =  ${param_month_year_name}
--and cost_center_name = ${param_cost_center_name}
group by time_period, currency_name, month_year_name, cost_center_name,
activity_code, activity_name_long
having (sum(total_expense_ytd)<>0 or sum(total_income_ytd)<>0 )
Order by activity_code
;
