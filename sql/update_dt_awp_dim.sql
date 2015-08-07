UPDATE dt_awp
SET
    posting_year=b.posting_year
    , posting_month=b.posting_month
    , calendar_year=b.calendar_year
    , calendar_month=b.calendar_month
    , month_year_name=b.month_year_name
FROM
    dim_time b
WHERE
    dt_awp.time_period=b.time_period
;

UPDATE dt_awp
SET
    currency_name=b.currency_name
FROM
    dim_currency b
WHERE
    dt_awp.currency=b.currency
;

UPDATE dt_awp
SET
    order_name=b.order_name
    , order_name_long=b.order_name_long
FROM
    dim_order b
WHERE
    dt_awp.order_number=b.order_number
;

UPDATE dt_awp
SET
    activity_code=b.activity_code
    , activity_name_long=b.activity_name
    , activity_group_lvl_1=b.activity_group_lvl_1
FROM
    dim_activity b
WHERE
    (length(order_number)=8
    OR length(order_number)=12)
    AND substring(order_number,2,3)=b.activity_code
;

UPDATE dt_awp
SET
    cost_center=b.cost_center
    , cost_center_name=b.cost_center_name
    , cost_center_name_long=b.cost_center_name_long
FROM
    dim_cost_center b
WHERE
    (length(order_number)=8
    OR length(order_number)=12)
    AND substring(order_number,5,4)=right(b.cost_center,4)
;
   
UPDATE dt_awp 
SET
    donor=b.donor
    , donor_name=c.donor_name
    , donor_name_long=c.donor_name_long
FROM
    sap_aufk b 
    INNER JOIN dim_donor c ON (b.donor=c.donor)
WHERE
    dt_awp.order_number=b.order_number
;

