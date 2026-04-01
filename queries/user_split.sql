WITH all_x402 AS(
    SELECT *
    FROM dune.kundeus.result_x_402_updating
    UNION ALL
    SELECT *
    FROM dune.kundeus.result_raw_x402_historical
)

SELECT
    CASE
        WHEN total_tx = 1 THEN '1'
        WHEN total_tx <= 5 THEN '2-5'
        WHEN total_tx <= 20 THEN '6-20'
        ELSE '20+'
    END AS user_segment,
    COUNT(*) AS wallet_count
FROM (
    SELECT payer_wallet, SUM(tx_count) AS total_tx
    FROM all_x402
    GROUP BY payer_wallet -- so they aren't duplicated
)
GROUP BY 1
ORDER BY MIN(total_tx) ASC

