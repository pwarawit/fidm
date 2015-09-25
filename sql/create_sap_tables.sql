
CREATE TABLE public.sap_cooi (
                ref_document_category VARCHAR(4),
                ref_document_number VARCHAR(10),
                ref_document_line_item INTEGER,
                vendor_number VARCHAR(100),
                object_number VARCHAR(22),
                co_key_sub_number VARCHAR(14),
                fiscal_year INTEGER NOT NULL,
                value_type VARCHAR(2),
                cost_element VARCHAR(10),
                debitcredit_ind VARCHAR(1),
                trans_currency VARCHAR(3),
                document_date DATE,
                expected_debit_date DATE,
                period INTEGER,
                exchange_rate NUMERIC,
                planned_value_local_currency NUMERIC,
                total_value_local_currency NUMERIC,
                planned_value_co_currency NUMERIC,
                total_value_co_currency NUMERIC,
                planned_value_trans_currency NUMERIC,
                total_value_trans_currency NUMERIC,
                planned_value_obj_currency NUMERIC,
                total_value_obj_currency NUMERIC,
                delete_flag VARCHAR(1)
);


CREATE TABLE public.sap_bpja (
                object_number VARCHAR(22) NOT NULL,
                value_type VARCHAR(2) NOT NULL,
                fiscal_year INTEGER NOT NULL,
                version VARCHAR(3) NOT NULL,
                budget_type VARCHAR(4) NOT NULL,
                trans_currency VARCHAR(3),
                annual_value_trans_currency NUMERIC,
                annual_value_gl_currency NUMERIC,
                dist_annual_value_trans_currency NUMERIC,
                dist_annual_value_gl_currency NUMERIC
);


CREATE TABLE public.sap_bpge (
                object_number VARCHAR(22) NOT NULL,
                value_type VARCHAR(2) NOT NULL,
                version VARCHAR(3) NOT NULL,
                budget_type VARCHAR(4) NOT NULL,
                trans_currency VARCHAR(3),
                value_trans_currency NUMERIC,
                value_gl_currency NUMERIC,
                dist_value_trans_currency NUMERIC,
                dist_value_gl_currency NUMERIC
);


CREATE TABLE public.sap_skat (
                language VARCHAR(1) NOT NULL,
                chart_of_accounts VARCHAR(4) NOT NULL,
                gl_account VARCHAR(10) NOT NULL,
                description VARCHAR(60)
);


CREATE TABLE public.sap_coep (
                document_number VARCHAR(10) NOT NULL,
                posting_row INTEGER NOT NULL,
                period INTEGER,
                value_trans_currency NUMERIC,
                trans_currency VARCHAR(3),
                value_obj_currency NUMERIC,
                obj_currency VARCHAR(3),
                value_co_area_currency NUMERIC,
                object_number VARCHAR(22),
                fiscal_year INTEGER,
                cost_element VARCHAR(10),
                transaction_currency VARCHAR(3),
                object_currency VARCHAR(3),
                name VARCHAR(50),
                posting_row_ref_doc INTEGER,
                document_item_number INTEGER,
                donor VARCHAR(5),
                activity_code VARCHAR(5),
                donor_line VARCHAR(5),
                benefit_country VARCHAR(4),
                theme VARCHAR(1),
                outcome VARCHAR(1),
                genderrights VARCHAR(1),
                cf_leadership VARCHAR(1),
                monitorevaluat VARCHAR(1),
                staff_no VARCHAR(5)
);


CREATE TABLE public.sap_zdonor_grp (
                donor_grouping VARCHAR(5),
                donor_grouping_desc VARCHAR(50)
);


CREATE TABLE public.sap_csku (
                language VARCHAR(2) NOT NULL,
                cost_element VARCHAR(10) NOT NULL,
                name VARCHAR(20),
                description VARCHAR(40)
);


CREATE TABLE public.sap_zbenefit_country (
                benefit_country VARCHAR(4),
                benefit_country_name VARCHAR(50)
);


CREATE TABLE public.sap_zstaff (
                staff_no VARCHAR(5),
                staff_name VARCHAR(70)
);


CREATE TABLE public.sap_cskt (
                cost_center VARCHAR(10) NOT NULL,
                valid_to_date DATE NOT NULL,
                name VARCHAR(20),
                description VARCHAR(40)
);


CREATE TABLE public.sap_ztheme (
                theme VARCHAR(1),
                theme_name VARCHAR(50)
);


CREATE TABLE public.sap_zmon_val (
                monitorevaluat VARCHAR(1),
                monitorevaluat_name VARCHAR(50)
);


CREATE TABLE public.sap_csks (
                cost_center VARCHAR(10) NOT NULL,
                valid_to_date DATE NOT NULL,
                valid_from_date DATE,
                cost_center_category VARCHAR(1),
                currency VARCHAR(5),
                department VARCHAR(12),
                title VARCHAR(35),
                name VARCHAR(35),
                name_2 VARCHAR(35)
);


CREATE TABLE public.sap_aufk (
                order_number VARCHAR(12) NOT NULL,
                description VARCHAR(40),
                currency VARCHAR(5),
                donor VARCHAR(5),
                activity_code VARCHAR(5),
                donor_line VARCHAR(5),
                benefit_country VARCHAR(4),
                theme VARCHAR(1),
                outcome VARCHAR(1),
                genderrights VARCHAR(1),
                cf_leadership VARCHAR(1),
                monitorevaluat VARCHAR(1)
);


CREATE TABLE public.sap_zdonor_line (
                donor_line VARCHAR(5),
                donor_line_name VARCHAR(50)
);


CREATE TABLE public.sap_bseg (
                document_number VARCHAR(10) NOT NULL,
                fiscal_year INTEGER NOT NULL,
                line_item INTEGER NOT NULL,
                posting_key VARCHAR(2),
                account_type VARCHAR(1),
                debitcredit_ind VARCHAR(1),
                amount_local_currency NUMERIC,
                dummy_currency_1 VARCHAR(3),
                amount_doc_currency NUMERIC,
                dummy_currency_2 VARCHAR(3),
                gl_amount NUMERIC,
                doc_currency VARCHAR(3),
                gl_currency VARCHAR(3),
                item_text VARCHAR(50),
                cost_center VARCHAR(10),
                order_number VARCHAR(12),
                gl_account VARCHAR(10),
                bs_account_flag VARCHAR(1),
                pl_account_type VARCHAR(2),
                functional_area VARCHAR(16),
                cost_element VARCHAR(10),
                donor VARCHAR(5),
                activity_code VARCHAR(5),
                donor_line VARCHAR(5),
                benefit_country VARCHAR(4),
                theme VARCHAR(1),
                outcome VARCHAR(1),
                gender_rights VARCHAR(1),
                cf_leader VARCHAR(1),
                monitor_eval VARCHAR(1),
                staff_no VARCHAR(5)
);


CREATE TABLE public.sap_zactivity (
                activity_code VARCHAR(5),
                activity_name VARCHAR(50)
);


CREATE TABLE public.sap_bkpf (
                document_number VARCHAR(10) NOT NULL,
                fiscal_year INTEGER NOT NULL,
                document_type VARCHAR(2),
                document_date DATE,
                posting_date DATE,
                posting_period INTEGER,
                document_header_text VARCHAR(25),
                currency VARCHAR(3),
                exchange_rate NUMERIC,
                document_status VARCHAR(1),
                local_currency VARCHAR(3),
                local_currency_2 VARCHAR(3),
                local_currency_3 VARCHAR(3),
                exchange_rate_2 NUMERIC,
                exchange_rate_3 NUMERIC
);


CREATE TABLE public.sap_zoutcome (
                outcome VARCHAR(1),
                outcome_name VARCHAR(50)
);


CREATE TABLE public.sap_vbkpf (
                document_number VARCHAR(10) NOT NULL,
                fiscal_year INTEGER NOT NULL,
                document_status VARCHAR(1),
                posting_period INTEGER,
                user_name VARCHAR(12),
                reference VARCHAR(16),
                document_header_text VARCHAR(25)
);


CREATE TABLE public.sap_cobk (
                document_number VARCHAR(10),
                fiscal_year INTEGER,
                from_period INTEGER,
                to_period INTEGER,
                document_date DATE,
                posting_date DATE,
                document_header_text VARCHAR(50),
                ref_document_number VARCHAR(10),
                co_area_currency VARCHAR(5)
);


CREATE TABLE public.sap_zcf_leader (
                cf_leadership VARCHAR(1),
                cf_leadership_name VARCHAR(50)
);


CREATE TABLE public.sap_zdonor (
                donor VARCHAR(5),
                donor_name VARCHAR(50),
                donor_grouping VARCHAR(5)
);


CREATE TABLE public.sap_zgender_rights (
                genderrights VARCHAR(1),
                genderrights_name VARCHAR(50)
);


CREATE TABLE public.sap_ska1 (
                chart_of_accounts VARCHAR(4) NOT NULL,
                gl_account VARCHAR(10) NOT NULL,
                balance_sheet_account VARCHAR(1),
                gl_account_2 VARCHAR(10),
                group_account_number VARCHAR(10),
                pl_statement_account_type VARCHAR(2),
                account_group VARCHAR(4)
);