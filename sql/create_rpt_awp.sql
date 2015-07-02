create table rpt_awp as (
select
	b.posting_year
	, b.posting_month
	, b.calendar_year
	, b.calendar_month
	, b.month_year_name
	, a.currency
	, c.cost_center_name
	, coalesce(d.activity_code,' ') program_code
	, coalesce(d.activity_name,' ') project_description
	, coalesce(d.activity_group_lvl_1_name,' ') project_leader_name
	, sum(a.amount_actual_mth) expenditure_mth
	, sum(a.amount_actual_ytd) expenditure_ytd
	, sum(a.amount_budget_ytd) budget_ytd
	, sum(a.amount_budget_ytd)-sum(a.amount_actual_ytd) balance_ytd
from fact_expenditure a
	left outer join dim_time b on (a.time_period = b.time_period)
	left outer join dim_cost_center c on (a.cost_center = c.cost_center)
	left outer join dim_activity d on (a.activity_code = d.activity_code)
group by 
	b.posting_year
	, b.posting_month
	, b.calendar_year
	, b.calendar_month
	, b.month_year_name
	, a.currency
	, c.cost_center_name
	, d.activity_code
	, d.activity_name
	, d.activity_group_lvl_1_name
)

