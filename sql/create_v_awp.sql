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
    , sum(value_obj_currency) as value
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
    , sum(value_obj_currency) as value
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
    , sum(value_obj_currency) as value
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
    , sum(value_obj_currency) as value
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
