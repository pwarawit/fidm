UPDATE dt_awp
SET
    total_expense_mth = 
        (coalesce(prf_expense_mth,0)
        + coalesce(rtg_expense_mth,0)
        + coalesce(rcf_expense_mth,0)
        + coalesce(prj_expense_mth,0))
    , total_expense_ytd = 
        (coalesce(prf_expense_ytd,0)
        + coalesce(rtg_expense_ytd,0)
        + coalesce(rcf_expense_ytd,0)
        + coalesce(prj_expense_ytd,0))
    , total_income_mth = 
        (coalesce(prf_income_mth,0)
        + coalesce(rtg_income_mth,0)
        + coalesce(rcf_income_mth,0)
        + coalesce(prj_income_mth,0))
    , total_income_ytd = 
        (coalesce(prf_income_ytd,0)
        + coalesce(rtg_income_ytd,0)
        + coalesce(rcf_income_ytd,0)
        + coalesce(prj_income_ytd,0))
;

UPDATE dt_awp
SET
    total_budget1_ytd=total_budget0_ytd
;

UPDATE dt_awp
SET
    total_balance0_ytd = 
        total_budget0_ytd
        - (total_expense_ytd + total_expense_mth)
        - (total_income_ytd + total_income_mth)
    , total_balance1_ytd = 
        total_budget1_ytd
        - (total_expense_ytd + total_expense_mth)
        - (total_income_ytd + total_income_mth)
;

