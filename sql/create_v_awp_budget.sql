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
    , order_number;


