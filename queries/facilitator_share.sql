WITH all_x402 AS (
    SELECT * FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * FROM dune.kundeus.result_x_402_updating
)

SELECT
    facilitator_name,
    SUM(tx_count) AS transactions,
    SUM(total_spend_usd) AS volume_usd,
    ROUND(100.0 * SUM(tx_count) / NULLIF(SUM(SUM(tx_count)) OVER (), 0), 2) AS tx_share_pct,
    DATE_TRUNC('month', week) AS "month"
FROM all_x402
GROUP BY facilitator_name, DATE_TRUNC('month', week)
ORDER BY transactions DESC
