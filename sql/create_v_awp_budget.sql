CREATE OR REPLACE VIEW v_awp_budget AS 
SELECT
    substring(object_number, 3, length(object_number)) AS order_number
    , to_number('2015', '9999') AS posting_year
    , trans_currency AS currency
    , sum(dist_value_trans_currency) AS dist_budget_amt
FROM 
    sap_bpge
WHERE 
    value_type='42' 
    AND budget_type='KBFC'
GROUP BY 
    substring(object_number, 3, length(object_number)) 
    , to_number('2015', '9999') 
    , trans_currency
UNION ALL
SELECT
    substring(object_number, 3, length(object_number)) AS order_number
    , fiscal_year AS posting_year
    , trans_currency AS currency
    , sum(dist_annual_value_trans_currency) AS dist_budget_amt
FROM 
    sap_bpja
WHERE 
    value_type='42' 
    AND budget_type='KBFC'
GROUP BY 
    substring(object_number, 3, length(object_number)) 
    , fiscal_year
    , trans_currency
ORDER BY order_number;


