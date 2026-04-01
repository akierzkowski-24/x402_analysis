WITH all_x402 AS (
    SELECT * FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * FROM dune.kundeus.result_x_402_updating
),

facilitator_weekly AS (
    SELECT
        blockchain,
        facilitator_name,
        week,
        SUM(total_spend_usd) AS volume_usd,
        SUM(tx_count) AS transactions,
        SUM(total_spend_usd) / NULLIF(SUM(tx_count), 0) AS avg_transaction_usd
    FROM all_x402
    GROUP BY blockchain, facilitator_name, week
)

SELECT 
    CASE 
        WHEN avg_transaction_usd <= 0.01 THEN '$0.00 - $0.01'
        WHEN avg_transaction_usd <= 0.05 THEN '$0.01 - $0.05'
        WHEN avg_transaction_usd <= 0.1 THEN '$0.05 - $0.10'
        WHEN avg_transaction_usd <= 0.25 THEN '$0.10 - $0.25'
        WHEN avg_transaction_usd <= 0.5 THEN '$0.25 - $0.50'
        WHEN avg_transaction_usd <= 1 THEN '$0.5 - $1'
        WHEN avg_transaction_usd <= 5 THEN '$1 - $5'
        ELSE '>$5'
    END AS tx_buckets,
    SUM(volume_usd) as volume_usd,
    SUM(transactions) as transaction_count
FROM facilitator_weekly
GROUP BY 1
ORDER BY tx_buckets ASC
