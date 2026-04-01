WITH all_x402 AS (
    SELECT * FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * FROM dune.kundeus.result_x_402_updating
)

SELECT
    DATE_TRUNC('month', week) AS month,
    blockchain,
    SUM(tx_count) AS transaction_count
FROM all_x402
GROUP BY 1, 2
ORDER BY 1 ASC, 2
