WITH all_x402 AS (
    SELECT * 
    FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * 
    FROM dune.kundeus.result_x_402_updating
)

SELECT
    DATE_TRUNC('month', week) AS month,
    ROUND(SUM(total_spend_usd) / NULLIF(SUM(tx_count), 0), 3) AS avg_transaction_usd,
    SUM(tx_count) AS total_transactions,
    COUNT(DISTINCT payer_wallet) AS active_wallets
FROM all_x402
GROUP BY DATE_TRUNC('month', week)
ORDER BY month ASC
