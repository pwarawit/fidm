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

