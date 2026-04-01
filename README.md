# x402 Protocol Analysis

On-chain analysis of the x402 payment protocol on Solana — tracking transaction volume,
facilitator economics, wallet growth, and user behaviour using Dune Analytics.

📊 **[Live Dashboard →](https://dune.com/kundeus/x402-first-chart-analysis)**

---

## Dashboard Preview

<img width="1732" height="1116" alt="image" src="https://github.com/user-attachments/assets/370c5d4c-88c6-4cde-9c81-0dd4df2da189" />

---

## Queries

### Volume & Transactions
| Query | Description |
|---|---|
| `tx_count.sql` | Total transaction count over time |
| `weekly_tx_count.sql` | Weekly transaction cadence |
| `tx_size_per_month.sql` | Average transaction size per month |
| `volume_and_tx_worth.sql` | USD volume alongside per-tx value |
| `last_week_usd_volume.sql` | Rolling last-week volume snapshot |
| `tx_count_last_90_by_facilitator.sql` | 90-day transaction breakdown by facilitator |

### Facilitator Economics
| Query | Description |
|---|---|
| `facilitator_share.sql` | Overall fee share per facilitator |
| `facilitator_share_by_tx_count.sql` | Share weighted by transaction count |
| `facilitator_share_over_weeks.sql` | Facilitator share trend over time |
| `facilitator_share_weekly.sql` | Weekly fee share per facilitator |
| `facilitator_share_weekly_by_tx_count.sql` | Weekly share by tx count |
| `average_worth_per_facilitator.sql` | Average transaction value per facilitator |

### Wallet & User Activity
| Query | Description |
|---|---|
| `total_wallets.sql` | Cumulative wallet count |
| `unique_wallet_count.sql` | Unique active wallets over time |
| `new_wallets_monthly.sql` | Monthly new wallet acquisition |
| `user_retention.sql` | Cohort retention of wallets |
| `user_split.sql` | Distribution of users by activity level |
| `current_tx_profile.sql` | Snapshot of current transaction patterns |

### Chain & Data Basis
| Query | Description |
|---|---|
| `chain_domination.sql` | x402 share of relevant on-chain activity |
| `IMPORTANT_2025_data_basis.sql` | Base dataset — 2025 historical transactions |
| `IMPORTANT_data_since_2026.sql` | Base dataset — 2026 transactions to present |

---

## About x402

x402 is a Solana-native payment protocol enabling programmable on-chain payments with
native fee splitting between facilitators and the protocol. This analysis tracks adoption
metrics, facilitator competition, and user retention since launch.

---

## Links

- 🔗 [Dune Dashboard](https://dune.com/kundeus/x402-first-chart-analysis)
- 💼 [LinkedIn](https://www.linkedin.com/posts/adam-kierzkowski-ak07_web3-defi-onchainanalytics-ugcPost-7444690584285503488-4UXe?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF6DFYsBum_jCmnOfK3fNDoHCsvjA8K6UiA)
- ✍️ [Substack](https://substack.com/home/post/p-192623635)

---

*Built with [Dune Analytics](https://dune.com)*
