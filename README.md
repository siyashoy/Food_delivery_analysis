# Food Delivery Delay & Cancellation Analysis

**In this dataset, 8 in 10 orders arrived late and 1 in 5 was cancelled. I used SQL to find where the delays and cancellations cluster, and what they cost.**

![SQL](https://img.shields.io/badge/SQL-MySQL-blue) ![Excel](https://img.shields.io/badge/Excel-data%20prep-green)

## The question
Why do deliveries run late, which orders get cancelled, and how much order value is lost as a result?

## The data
- **Base data:** a public Kaggle food delivery route dataset: 200 orders, 10 columns (distance, delivery time, traffic, weather, delivery mode, zones), 1-4 January 2025.
- **What I added:** the Kaggle file has no delays, cancellations or money, so I generated six extra columns with ChatGPT: `expected_delivery_time`, `delay_flag`, `cancellation_flag`, `cancellation_reason`, `order_value` and `refund_amount`. These are synthetic values, not real company data. The findings below describe this practice dataset. They show how I would investigate delays and cancellations, not what a real business would find.
- Final file: 200 orders, 16 columns, no duplicate order IDs. The only blanks are cancellation reasons on orders that were not cancelled.
- Amounts are in INR (₹). The dataset doesn't state a currency, so I assumed rupees based on typical order sizes.

## What I did
1. Checked the data in Excel (duplicates, blanks, and that each late flag matches delivery time vs expected time).
2. Loaded it into MySQL and wrote queries to compare actual against expected delivery time and measure late rates (`sql_queries.sql`).
3. Broke late and cancelled orders down by traffic, weather, customer zone and cancellation reason.
4. Added up the refunds paid on cancelled orders.

## Key findings
| Metric | Result |
|---|---|
| Orders analysed | 200 |
| Late orders | 160 (80%) |
| Average delivery time vs expected | 44.7 min vs 29.9 min |
| Late orders: average time over the estimate | 19.7 min |
| Cancelled orders | 41 (20.5%) |
| Refunds on cancelled orders | ₹18,425 (19.9% of ₹92,475 total order value) |
| Cancellation rate: late vs on-time orders | 22.5% vs 12.5% |
| Cancellations that followed a late delivery | 36 of 41 |

**Why orders were cancelled:** high traffic 15, late delivery 12, restaurant delay 8, customer cancelled 6.

**By customer zone:**

| Zone | Orders | Avg delivery (min) | Late | Cancelled |
|---|---|---|---|---|
| Central | 38 | 44.3 | 89.5% | 26.3% |
| South | 36 | 49.7 | 80.6% | 25.0% |
| East | 45 | 46.9 | 77.8% | 15.6% |
| North | 46 | 42.7 | 78.3% | 21.7% |
| West | 35 | 40.1 | 74.3% | 14.3% |

Central is late most often and has the most cancellations. South is slowest on average. West is the best on both measures.

**What did not explain lateness:** late rates were 77% in high traffic, 78% in medium and 86% in low. By weather, cloudy was worst (91%) and rainy was best (73%). So in this sample, traffic and weather do not explain which orders run late. Traffic shows up mainly as a *stated reason* for cancellation.

## Recommendations
- Check how the expected delivery time is set. With 80% of orders late and an average gap of about 15 minutes, the estimate may be too optimistic, not only the riders too slow.
- Look first at Central and South.
- Talk to restaurants about prep delays, the reason behind 8 cancellations.

## Limits
- This is a small, partly created dataset: 4 days and 200 orders. Treat the results as patterns to test on real data, not conclusions.
- 3 of the 12 orders cancelled for "Late Delivery" are flagged On-time in the data (query 5 in the SQL file), so that coding would need checking at the source.

## Files
- [Dataset_cleaned.csv](Dataset_cleaned.csv): the full 16-column dataset
- [sql_queries.sql](sql_queries.sql): table setup and every query used, with comments
