SELECT 
    b.donor_name
    , b.donor_grouping
    , count(*)
FROM
    sap_aufk a
    , sap_zdonor b
WHERE
    a.donor=b.donor
GROUP BY 
    b.donor_name
    ,
    b.donor_grouping
    ;

