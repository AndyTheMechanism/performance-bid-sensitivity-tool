-- Step 1: Create the main table for raw data import
CREATE TABLE performance_report (
    date DATE,
    campaign_type VARCHAR(100),
    campaign_name VARCHAR(255),
    campaign_id BIGINT,
    group_name VARCHAR(255),
    group_id BIGINT,
    device_type VARCHAR(50),
    gender VARCHAR(20),
    age VARCHAR(20),
    impressions INTEGER,
    clicks INTEGER,
    ctr NUMERIC(10, 4),
    costs_rub NUMERIC(18, 2),
    bounce_rate NUMERIC(10, 4),
    depth_pages NUMERIC(10, 2),
    conv_call INTEGER,
    conv_registration INTEGER,
    conv_smb INTEGER,
    conv_enterprise INTEGER,
    conv_any INTEGER,
    conv_soho_micro INTEGER,
    conv_soho INTEGER,
    conv_soho_plus INTEGER,
    conv_smb_plus INTEGER,
    conv_enterprise_plus INTEGER
);

-- Note: Data was imported via pgAdmin Import/Export tool from 'Real_Anonymized_Performance_Report.csv'