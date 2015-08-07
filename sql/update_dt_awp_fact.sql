
truncate table dt_awp;

insert into dt_awp
	(time_period, order_number, currency
    , total_budget0_ytd
	, prf_expense_mth
    , prf_expense_ytd
    , prf_income_mth
    , prf_income_ytd
	, rtg_expense_mth
    , rtg_expense_ytd
    , rtg_income_mth
    , rtg_income_ytd
	, rcf_expense_mth
    , rcf_expense_ytd
    , rcf_income_mth
    , rcf_income_ytd
	, prj_expense_mth
    , prj_expense_ytd
    , prj_income_mth
    , prj_income_ytd
	)
	select 
        a.time_period, a.order_number, a.currency
        , sum(a.dist_budget_amt) as total_budget0_ytd 
        , sum(b.value_mth) as prf_expense_mth
        , sum(c.value_ytd) as prf_expense_ytd
        , sum(d.value_mth) as prf_income_mth
        , sum(e.value_ytd) as prf_income_ytd
        , sum(f.value_mth) as rtg_expense_mth
        , sum(g.value_ytd) as rtg_expense_ytd
        , sum(h.value_mth) as rtg_income_mth
        , sum(i.value_ytd) as rtg_income_ytd
        , sum(j.value_mth) as rcf_expense_mth
        , sum(k.value_ytd) as rcf_expense_ytd
        , sum(l.value_mth) as rcf_income_mth
        , sum(m.value_ytd) as rcf_income_ytd
        , sum(n.value_mth) as prj_expense_mth
        , sum(o.value_ytd) as prj_expense_ytd
        , sum(p.value_mth) as prj_income_mth
        , sum(q.value_ytd) as prj_income_ytd
	from 
        v_awp_budget a
        left outer join v_awp_prf_expense b on (a.time_period=b.time_period AND a.order_number=b.order_number AND a.currency=b.currency)
        left outer join v_awp_prf_expense_ytd c on (a.time_period=c.time_period AND a.order_number=c.order_number AND a.currency=c.currency)
        left outer join v_awp_prf_income d on (a.time_period=d.time_period AND a.order_number=d.order_number AND a.currency=d.currency)
        left outer join v_awp_prf_income_ytd e on (a.time_period=e.time_period AND a.order_number=e.order_number AND a.currency=e.currency)
        left outer join v_awp_rtg_expense f on (a.time_period=f.time_period AND a.order_number=f.order_number AND a.currency=f.currency)
        left outer join v_awp_rtg_expense_ytd g on (a.time_period=g.time_period AND a.order_number=g.order_number AND a.currency=g.currency)
        left outer join v_awp_rtg_income h on (a.time_period=h.time_period AND a.order_number=h.order_number AND a.currency=h.currency)
        left outer join v_awp_rtg_income_ytd i on (a.time_period=i.time_period AND a.order_number=i.order_number AND a.currency=i.currency)
        left outer join v_awp_rcf_expense j on (a.time_period=j.time_period AND a.order_number=j.order_number AND a.currency=j.currency)
        left outer join v_awp_rcf_expense_ytd k on (a.time_period=k.time_period AND a.order_number=k.order_number AND a.currency=k.currency)
        left outer join v_awp_rcf_income l on (a.time_period=l.time_period AND a.order_number=l.order_number AND a.currency=l.currency)
        left outer join v_awp_rcf_income_ytd m on (a.time_period=m.time_period AND a.order_number=m.order_number AND a.currency=m.currency)
        left outer join v_awp_prj_expense n on (a.time_period=n.time_period AND a.order_number=n.order_number AND a.currency=n.currency)
        left outer join v_awp_prj_expense_ytd o on (a.time_period=o.time_period AND a.order_number=o.order_number AND a.currency=o.currency)
        left outer join v_awp_prj_income p on (a.time_period=p.time_period AND a.order_number=p.order_number AND a.currency=p.currency)
        left outer join v_awp_prj_income_ytd q on (a.time_period=q.time_period AND a.order_number=q.order_number AND a.currency=q.currency)
    group by a.time_period, a.order_number, a.currency
    ;

