WITH all_x402 AS (
    SELECT * 
    FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * 
    FROM dune.kundeus.result_x_402_updating
)

SELECT SUM(tx_count) AS total_tx_count
FROM all_x402
