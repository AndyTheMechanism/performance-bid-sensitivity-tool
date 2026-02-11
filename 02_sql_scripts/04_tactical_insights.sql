-- Step 4: Tactical Analysis - Identifying Underperforming Campaigns

-- Ranking campaigns by CPP (Cost Per Process) in October 2025
-- Using CTE for better readability and performance
WITH OctoberStats AS (
    SELECT 
        campaign_name,
        SUM(costs_rub) AS total_spent,
        SUM(conv_any) AS total_conv,
        CASE 
            WHEN SUM(conv_any) > 0 THEN ROUND(SUM(costs_rub) / SUM(conv_any), 2) 
            ELSE 0 
        END AS avg_cpp
    FROM v_performance_analysis
    WHERE date >= '2025-10-01' AND date <= '2025-10-31'
    GROUP BY campaign_name
    HAVING SUM(conv_any) > 0
)
SELECT 
    *,
    -- Showing the relative rank of the campaign by cost efficiency
    RANK() OVER (ORDER BY avg_cpp DESC) as inefficiency_rank
FROM OctoberStats
ORDER BY avg_cpp DESC
LIMIT 10;