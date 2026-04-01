WITH all_x402 AS (
    SELECT * 
    FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * 
    FROM dune.kundeus.result_x_402_updating
)

SELECT facilitator_name,
    COUNT(DISTINCT payer_wallet) AS total_wallets,
    AVG(active_weeks) AS avg_weeks_active,
    COUNT_IF(tx_count_total > 5) AS power_users
FROM (
    SELECT payer_wallet, facilitator_name,
           SUM(tx_count) AS tx_count_total,
           COUNT(DISTINCT week) AS active_weeks
    FROM all_x402   
    GROUP BY payer_wallet, facilitator_name
)
GROUP BY facilitator_name
HAVING COUNT(DISTINCT payer_wallet) > 1000
ORDER BY avg_weeks_active DESC
