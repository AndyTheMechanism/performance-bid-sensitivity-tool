-- Step 3: Create a Virtual Layer for reporting (Semantic Layer)
-- This view handles calculated metrics to avoid "Mean of Means" errors in basic SQL queries

CREATE OR REPLACE VIEW v_performance_analysis AS
SELECT 
    *,
    -- Calculating Cost Per Click (CPC)
    CASE WHEN clicks > 0 THEN ROUND(costs_rub / clicks, 2) ELSE 0 END AS cpc,
    
    -- Calculating Cost Per Process (CPP) - Core B2B Metric
    CASE WHEN conv_any > 0 THEN ROUND(costs_rub / conv_any, 2) ELSE 0 END AS cpp_any,
    
    -- Conversion Rate from Click to Any Process (%)
    CASE 
        WHEN clicks > 0 THEN ROUND((conv_any::numeric / clicks) * 100, 2) 
        ELSE 0 
    END AS cr_percent
FROM performance_report;

-- Quick validation of the view
SELECT * FROM v_performance_analysis LIMIT 5;