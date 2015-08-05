CREATE OR REPLACE VIEW v_awp_budget AS 
SELECT
    to_number('201500', '999999') AS time_period
    , substring(object_number, 3, length(object_number)) AS order_number
    , trans_currency AS currency
    , sum(dist_value_trans_currency) AS dist_budget_amt
FROM 
    sap_bpge
WHERE 
    value_type='42' 
    AND budget_type='KBFC'
GROUP BY 
    to_number('201500', '999999') 
    , substring(object_number, 3, length(object_number)) 
    , trans_currency
UNION ALL
SELECT
    fiscal_year*100 AS time_period
    , substring(object_number, 3, length(object_number)) AS order_number
    , trans_currency AS currency
    , sum(dist_annual_value_trans_currency) AS dist_budget_amt
FROM 
    sap_bpja
WHERE 
    value_type='42' 
    AND budget_type='KBFC'
GROUP BY 
    fiscal_year
    , substring(object_number, 3, length(object_number)) 
    , fiscal_year
    , trans_currency
ORDER BY 
    time_period
    , order_number
;


CREATE OR REPLACE VIEW v_awp_prf_expense AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='PRF'
    AND left(cost_element,1) in ('5','6','9')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;



CREATE OR REPLACE VIEW v_awp_rtg_expense AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='RTG'
    AND left(cost_element,1) in ('5','6','9')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_rcf_expense AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='RCF'
    AND left(cost_element,1) in ('5','6','9')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_prj_expense AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor not in ('RCF','RTG','PRF')
    AND left(cost_element,1) in ('5','6','9')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_prf_income AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='PRF'
    AND left(cost_element,1) in ('1','4')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;



CREATE OR REPLACE VIEW v_awp_rtg_income AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='RTG'
    AND left(cost_element,1) in ('1','4')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_rcf_income AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor='RCF'
    AND left(cost_element,1) in ('1','4')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_prj_income AS 
SELECT
    fiscal_year*100+period as time_period
    , substring(object_number, 3, length(object_number)) as order_number
    , object_currency as currency
    , sum(value_obj_currency) as value_mth
FROM 
    sap_coep
WHERE 
    donor not in ('RCF','RTG','PRF')
    AND left(cost_element,1) in ('1','4')
GROUP BY 
    time_period
    , order_number
    , currency
ORDER BY
    time_period
    , order_number
;

CREATE OR REPLACE VIEW v_awp_prf_expense_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_prf_expense AS a
    LEFT JOIN v_awp_prf_expense AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_rtg_expense_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_rtg_expense AS a
    LEFT JOIN v_awp_rtg_expense AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_rcf_expense_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_rcf_expense AS a
    LEFT JOIN v_awp_rcf_expense AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_prj_expense_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_prj_expense AS a
    LEFT JOIN v_awp_prj_expense AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;


CREATE OR REPLACE VIEW v_awp_prf_income_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_prf_income AS a
    LEFT JOIN v_awp_prf_income AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_rtg_income_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_rtg_income AS a
    LEFT JOIN v_awp_rtg_income AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_rcf_income_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_rcf_income AS a
    LEFT JOIN v_awp_rcf_income AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

CREATE OR REPLACE VIEW v_awp_prj_income_ytd AS
SELECT
    a.order_number
    , a.time_period
    , a.currency
    , sum(b.value_mth) AS value_ytd
FROM
    v_awp_prj_income AS a
    LEFT JOIN v_awp_prj_income AS b
        ON (a.order_number=b.order_number
            AND a.time_period > b.time_period
            AND a.currency=b.currency)
GROUP BY 
    a.order_number
    , a.time_period
    , a.currency
ORDER BY
    a.order_number
    , a.time_period
;

