-- Step 2: Data Quality Assurance & Cleaning

-- Check for logical anomalies (clicks without impressions)
SELECT * FROM performance_report WHERE clicks > impressions;

-- Remove detected anomalies to ensure data integrity
DELETE FROM performance_report WHERE clicks > impressions AND impressions = 0;

-- Verify no negative costs exist
SELECT COUNT(*) FROM performance_report WHERE costs_rub < 0;

-- Check for NULLs in critical business dimensions
SELECT 
    COUNT(*) FILTER (WHERE campaign_name IS NULL) as null_campaigns,
    COUNT(*) FILTER (WHERE date IS NULL) as null_dates
FROM performance_report;