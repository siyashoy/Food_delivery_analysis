Food Delivery Delay & Cancellation Analysis

80% of orders in this dataset ran late, and one in five was cancelled. This project finds where the delays and cancellations come from, and what they cost.

The Question
Why do deliveries run late, which orders get cancelled, and how much order value is lost?

The data
o	Public food delivery dataset from Kaggle: [add dataset name and link]
o	200 orders, 16 columns, 1-4 January 2025
o	No duplicate order IDs. The only missing values are the cancellation reasons on orders that were not cancelled.
o	Currency is not stated in the dataset, so amounts are shown without a symbol.

What I did
1.	Cleaned and checked the data in Excel.
2.	Used SQL to compare actual and expected delivery times and flag late orders (sql_queries.sql).
3.	Grouped cancellations by reason, traffic level, weather, zone and delivery mode.
4.	Calculated the order value lost to cancellations.

Key findings
Metric	                                                          Result
Orders analysed	                                                   200
Late orders	                                                     160 (80%)
Average delivery time vs expected	                            44.7 min vs 29.9 min
Late orders: average time over the estimate	                      19.7 min
Cancelled orders	                                               41 (20.5%)
Refunds on cancelled orders	                         18,425 (19.9% of 92,475 total order value)
Cancellation rate: late vs on-time orders	                      22.5% vs 12.5%
Cancellations that followed a late delivery	                      36 of 41

Cancellation reasons: High traffic 15, late delivery 12, restaurant delay 8, customer cancelled 6.
By customer zone: Central had the highest late rate (89.5%) and cancellation rate (26.3%). South had the longest average delivery (49.7 min). West was the best performer (74.3% late, 14.3% cancelled).
What the data did not show: Late rates were 76% in high traffic, 78% in medium and 86% in low traffic. By weather, cloudy was worst (91% late) and rainy was best (73%). So in this sample, traffic level and weather do not explain lateness. Traffic matters mainly as a stated reason for cancellation.

Recommendations
•	Check how the expected delivery time is set. With 80% of orders late and an average gap of about 15 minutes, the estimate may be too optimistic, not only the riders too slow.
•	Look first at the Central and South zones.
•	Work with restaurants on prep delays, the reason behind 8 cancellations.
Data notes and limits
•	Only 4 days and 200 orders, so these are patterns to test on a larger dataset, not firm conclusions.
•	3 of the 12 orders cancelled for "Late Delivery" are flagged On-time in the data, so the reason coding needs a check at the source.
Files
Dataset.csv - cleaned dataset
sql_queries.sql - all queries used


