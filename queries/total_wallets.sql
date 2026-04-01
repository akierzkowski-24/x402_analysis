WITH all_x402 AS (
    SELECT * 
    FROM dune.kundeus.result_raw_x402_historical
    UNION ALL
    SELECT * 
    FROM dune.kundeus.result_x_402_updating
)

SELECT COUNT(payer_wallet) AS total_unique_wallets
FROM all_x402
