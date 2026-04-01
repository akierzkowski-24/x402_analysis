-- Unique wallets 
WITH all_x402 AS(
    SELECT *
    FROM dune.kundeus.result_x_402_updating
    UNION ALL
    SELECT *
    FROM dune.kundeus.result_raw_x402_historical
)


SELECT COUNT(DISTINCT payer_wallet) AS number_of_wallets,
    DATE_TRUNC('month', week) AS "month",
    blockchain
FROM all_x402
GROUP BY DATE_TRUNC('month', week), blockchain
ORDER BY DATE_TRUNC('month', week) ASC
