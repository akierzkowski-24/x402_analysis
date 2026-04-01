WITH facilitator_weekly AS 
    (SELECT SUM(total_spend_usd) AS total_volume_by_facilitator,
            facilitator_name,
            week
    FROM dune.kundeus.result_x_402_updating
    GROUP BY facilitator_name, week),
    
weekly_totals AS
    (SELECT SUM(total_spend_usd) AS total_weekly,
            week    
    FROM dune.kundeus.result_x_402_updating
    GROUP BY week)
    
SELECT ROUND((fw.total_volume_by_facilitator / wt.total_weekly) * 100, 2) AS share,
    facilitator_name,
    fw.week
FROM weekly_totals AS wt
INNER JOIN facilitator_weekly AS fw ON wt.week = fw.week
WHERE ROUND((fw.total_volume_by_facilitator / wt.total_weekly) * 100, 2) > 0.05
ORDER BY ROUND((fw.total_volume_by_facilitator / wt.total_weekly) * 100, 2) DESC
