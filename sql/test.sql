insert into dt_awp
	(time_period, order_number, currency
    , total_budget0_ytd
	, prf_expense_mth
    , rcf_expense_mth
	)
	select 
        a.time_period, a.order_number, a.currency
        , sum(a.dist_budget_amt) as total_budget0_ytd 
        , sum(b.value_mth) as prf_expense_mth
        , sum(c.value_mth) as rcf_expense_mth
	from 
        v_awp_budget a
        left outer join v_awp_prf_expense b on (a.time_period=b.time_period AND a.order_number=b.order_number AND a.currency=b.currency)
        left outer join v_awp_rcf_expense c on (a.time_period=c.time_period AND a.order_number=c.order_number AND a.currency=c.currency)
    group by a.time_period, a.order_number, a.currency
    ;
