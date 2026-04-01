WITH all_x402 AS (
    SELECT * 
    FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * 
    FROM dune.kundeus.result_x_402_updating
),

new_wallets AS (
    SELECT MIN(week) AS first_week, payer_wallet
    FROM all_x402
    GROUP BY payer_wallet
)

SELECT DATE_TRUNC('month', first_week) AS "month",
    COUNT(*) AS new_wallets
FROM new_wallets
GROUP BY DATE_TRUNC('month', first_week)
ORDER BY DATE_TRUNC('month', first_week)
