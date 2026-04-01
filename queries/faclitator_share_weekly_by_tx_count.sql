WITH facilitator_weekly AS 
    (SELECT CAST(SUM(tx_count) AS DOUBLE) AS total_transactions_by_facilitator,
            facilitator_name,
            week
    FROM dune.kundeus.result_x_402_updating
    GROUP BY facilitator_name, week),
    
weekly_totals AS
    (SELECT CAST(SUM(tx_count) AS DOUBLE) AS total_transactions_weekly,
            week    
    FROM dune.kundeus.result_x_402_updating
    GROUP BY week)
    
SELECT ROUND((fw.total_transactions_by_facilitator / wt.total_transactions_weekly) * 100, 2) AS share, -- transactions is bigint
    facilitator_name,
    fw.week
FROM weekly_totals AS wt
INNER JOIN facilitator_weekly AS fw ON wt.week = fw.week
WHERE ROUND((total_transactions_by_facilitator / wt.total_transactions_weekly) * 100, 2) > 0.05
ORDER BY ROUND((total_transactions_by_facilitator / wt.total_transactions_weekly) * 100, 2) DESC
